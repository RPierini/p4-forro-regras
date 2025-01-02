#Versão do Forro
forro = 8
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

p4 = bfrt.p4streamsec.pipe

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

pipeline = "Ingress"
table = "ig"
action = "i"
#Inserindo regras de calculo do Forro
for round in range(0, total_rounds):
    #rounds ímpares é Ingress, rounds pares é Egress (portanto, pula insercao)
    if round % 2 == 0:
        continue

    #O QR a ser executado na travessia varia de 0 a 7, pares no Ingress e Ímpares no Egress
    qr = (round) % 8

    if qr == 1 or qr == 5:
            qr = 15

    #Último QR tem uma ação específicas para a finalizacao, estágio 11
    if round == (total_rounds-1):
        limit = 11
    else:
        limit = 12

    #Gerando codigo python para inserir registro na tabela
    for i in range(0, limit):
        code = f"p4.{pipeline}.tbl_stream_{table}{i}.add_with_{action}{i}_qr{qr}(round={round})"
        exec(code)
        #print(code)

#Inserindo regra para encaminhar para finalizacao
p4.Ingress.tbl_stream_ig11.add_with_i11_qr7_fin(round=(total_rounds-1))

## Trilha de finalizacao
# Regras por dispositivo
p4.Ingress.tbl_stream_ig0_finit.add_with_i0_add_values_forro(src_addr=0x080000000101, key0=0x34333231, key1=0x34333231, key2=0x34333231, key3=0x34333231, key4=0x34333231, key5=0x34333231, key6=0x34333231, key7=0x34333231)

# Regras padrao
p4.Ingress.tbl_stream_ig1_finit.add_with_i1_cipher_two_block(fin=1)
p4.Ingress.tbl_stream_ig2_finit.add_with_i2_cipher_two_block(fin=1)
p4.Ingress.tbl_stream_ig3_finit.add_with_i3_cipher_two_block(fin=1)
p4.Ingress.tbl_stream_ig4_finit.add_with_i4_cipher_two_block(fin=1)
p4.Ingress.tbl_stream_ig5_finit.add_with_i5_cipher_two_block(fin=1)
p4.Ingress.tbl_stream_ig6_finit.add_with_i6_cipher_two_block(fin=1)
p4.Ingress.tbl_stream_ig7_finit.add_with_i7_cipher_two_block(fin=1)
p4.Ingress.tbl_stream_ig8_finit.add_with_i8_cipher_two_block(fin=1)
p4.Ingress.tbl_stream_ig9_finit.add_with_i9_cipher_two_block(fin=1)

bfrt.complete_operations()