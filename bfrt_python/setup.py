#Versão do Forro
forro = 10
#Total rounds (ou total de travessias)
total_rounds = (forro * 4)
#Portas de entrada e saida
##TOFINO222
#Cavium: 136
#HTC: 150
#porta_cliente = 150
#porta_CPU = 150
##TOFINO-MODEL
#h1: 0
#h2: 1
#porta_saida = 1

p4 = bfrt.p4_forro.pipe

#This function can clear all the tables and later on other fixed objects
#once bfrt support is added.
def clear_all(verbose=True, batching=True):
    global p4
    global bfrt
    
    # The order is important. We do want to clear from the top, i.e.
    # delete objects that use other objects, e.g. table entries use
    # selector groups and selector groups use action profile members

    for table_types in (['MATCH_DIRECT', 'MATCH_INDIRECT_SELECTOR'],
                        ['SELECTOR'],
                        ['ACTION_PROFILE']):
        for table in p4.info(return_info=True, print_info=False):
            if table['type'] in table_types:
                if verbose:
                    print("Clearing table {:<40} ... ".
                          format(table['full_name']), end='', flush=True)
                table['node'].clear(batch=batching)
                if verbose:
                    print('Done')
                    
clear_all(verbose=True)

#Inserindo regras de calculo do Forro
for round in range(0, total_rounds):
    #rounds pares é Ingress, rounds ímpares é Egress
    if round % 2 == 0:
        pipeline = "Ingress"
        table = "ig"
        action = "i"
    else:
        pipeline = "Egress"
        table = "eg"
        action = "e"

    #O QR a ser executado na travessia varia de 0 a 7, pares no Ingress e Ímpares no Egress
    qr = (round) % 8

    #Último QR tem uma ação específicas para a finalizacao, estágio 11
    if round == (total_rounds-1):
        limit = 11
    else:
        limit = 12

    #Gerando codigo python para inserir registro na tabela
    for i in range(0, limit):
        code = f"p4.{pipeline}.tbl_forro_{table}{i}.add_with_{action}{i}_qr{qr}(rodada={round}+1)"
        exec(code)
        #print(code)

#Inserindo regra para encaminhar para finalizacao
p4.Egress.tbl_forro_eg11.add_with_e11_qr7_fin(rodada=(total_rounds))

## Trilha de finalizacao
# Regras por dispositivo

# Regras padrao
p4.Ingress.tbl_forro_ig0.add_with_i0_init(rodada=0)
p4.Ingress.tbl_forro_ig0.add_with_i0_cipher(rodada=total_rounds+1)

bfrt.complete_operations()