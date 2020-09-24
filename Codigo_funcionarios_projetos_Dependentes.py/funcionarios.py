import MySQLdb


def conectar():
    """
    Função para conectar ao servidor gael@2718
    Ctrl + d pra sair
    """
    try:
            conn = MySQLdb.connect(
            db ='empresa_tech',
            host ='localhost',
            user ='root',
            passwd ='gael@2718'
             )
            return conn
    except MySQLdb.Error as e:
            print("ERRO AO CONECTAR {}".format(e))


def desconectar(conn):
    """
    Função para desconectar do servidor.
    """
    if conn:
        conn.close()


def listar():

   conn = conectar()
   cursor = conn.cursor()
   cursor.execute('SELECT * FROM funcionarios')
   funcionarios = cursor.fetchall()

   if len(funcionarios) > 0:
       print('Lista de funcionarios')
       print('----------------')
       for funcionario in funcionarios:
           print(f'ID: {funcionario[0]}')
           print(f'NOME: {funcionario[1]}')
           print(f'CPF: {funcionario[2]}')
           print(f'SALARIO: {funcionario[3]}')
           print(f'SUPERVISOR: {funcionario[4]} ')
           print('----------------')
   else:
       print('Não existe funcionarios cadastrados')


def inserir():
    conn = conectar()
    cursor = conn.cursor()

    Nome= input('Informe o nome do funcionario: ')
    Cpf = input('Informe CPF: ')
    Salario = input('Informe o Salario: ')
    supervisor = input('Informe é supervisor (S/N): ')

    cursor.execute(f"INSERT INTO funcionarios (Nome, Cpf, Salario, supervisor) VALUES ('{Nome}', {Cpf}, '{Salario}', '{supervisor}')")
    conn.commit()

    if cursor.rowcount == 1:
        print(f'O funcionario {Nome} foi inserido com sucesso.')
    else:
        print('Não foi possivel inserir')
    desconectar(conn)

def atualizar():
  conn = conectar()
  cursor = conn.cursor()

  idFuncionario = int(input('Qual o codigo de funcionario que vai atualizar? '))
  Nome = input('Informe nova marca do veiculo')
  Cpf = input('Qual Cpf dele? ')
  Salario = input('Qual Salario  ? ')
  supervisor = input('É supervisor?(S/N) ')

  cursor.execute(f"UPDATE funcionarios SET Nome='{Nome}', Cpf='{Cpf}', Salario='{Salario}', supervisor='{supervisor}' WHERE id={idFuncionario}")
  conn.commit()

  if cursor.rowcount == 1:
      print('Funcionario atualizado com sucesso')
  else:
      print('Erro ao atualizar')
  desconectar(conn)


def deletar():

    conn = conectar()
    cursor = conn.cursor()

    Nome = int(input('Informe nome do funcionario que deseja excluir: '))
    cursor.execute(f"DELETE FROM funcionarios WHERE Nome={Nome}")
    conn.commit()

    if cursor.rowcount == 1:
        print('Excluido com sucesso')
    else:
        print('Erro ao excluir')
    desconectar(conn)

def juncao():
    conn = conectar()
    cursor = conn.cursor()
    cursor.execute('SELECT funcionarios.nome, projetos.nome_do_projeto FROM funcionarios join projetos on funcionarios.idFuncionarios=projetos.idProjetos;')
    funcionario_projetos = cursor.fetchall()

    if len(funcionario_projetos) > 0:
        print('Funcionarios em cada projeto')
        print('----------------')
        for funcionario in funcionario_projetos:
            print(f'NOME: {funcionario[0]}')
            print(f'NOME DO PROJETO: {funcionario[1]}')

            print('----------------')
    else:
        print('Não existe funcionarios cadastrados')


def menu():
    """
    Função para gerar o menu inicial
    """
    print('========= Gerenciamento de Empregados ==============')
    print('Selecione uma opção: ')
    print('1 - Listar Empregados.')
    print('2 - Inserir Empregados.')
    print('3 - Atualizar Empregados.')
    print('4 - Deletar Empregados.')
    print('5 - Listar funcionarios com projetos')
    print('6 - Acessar menu dependentes.')
    opcao = int(input('Digite sua escolha: '))
    if opcao in [1, 2, 3, 4, 5, 6]:
        if opcao == 1:
            listar()
        elif opcao == 2:
            inserir()
        elif opcao == 3:
            atualizar()
        elif opcao == 4:
            deletar()
        elif opcao == 5:
            juncao()
        elif opcao == 6:
            def listarDependente():

                conn = conectar()
                cursor = conn.cursor()
                cursor.execute('SELECT * FROM dependentes')
                dependentes = cursor.fetchall()

                if len(dependentes) > 0:
                    print('Lista de dependentes')
                    print('----------------')
                    for dependente in dependentes:
                        print(f'ID: {dependente[0]}')
                        print(f'NOME: {dependente[1]}')
                        print(f'IDADE: {dependente[2]}')
                        print(f'ID DO FUNCIONARIO: {dependente[3]}')

                        print('----------------')
                else:
                    print('Não existe dependentes cadastrados')

            def inserirDependente():
                conn = conectar()
                cursor = conn.cursor()

                Nome = input('Informe o nome do dependente: ')
                Idade = input('Informe a idade: ')
                idFuncionario = input('ID do funcionario correspondente a esse dependente:  ')

                cursor.execute(
                    f"INSERT INTO dependentes (Nome, Idade, idFuncionarios) VALUES ('{Nome}', {Idade}, '{idFuncionario}'")
                conn.commit()

                if cursor.rowcount == 1:
                    print(f'O dependente {Nome} foi inserido com sucesso.')
                else:
                    print('Não foi possivel inserir')
                desconectar(conn)

            def atualizarDependente():
                conn = conectar()
                cursor = conn.cursor()

                idDependente = int(input('Qual o codigo do dependene que vai atualizar? '))
                Nome = input('Informe novo nome do dependente')
                Idade = input('Qual Cpf dele? ')
                idFuncionario = input('Qual Salario  ? ')

                cursor.execute(
                    f"UPDATE funcionarios SET Nome='{Nome}', Idade='{Idade}', idFuncionario='{idFuncionario}' WHERE id={idDependente}")
                conn.commit()

                if cursor.rowcount == 1:
                    print('Dependente atualizado com sucesso')
                else:
                    print('Erro ao atualizar')
                desconectar(conn)

            def deletarDependentes():

                conn = conectar()
                cursor = conn.cursor()

                Nome = int(input('Informe nome do dependente que deseja excluir: '))
                cursor.execute(f"DELETE FROM dependentes WHERE Nome={Nome}")
                conn.commit()

                if cursor.rowcount == 1:
                    print('Excluido com sucesso')
                else:
                    print('Erro ao excluir')
                desconectar(conn)

            def juntarDependente():

                conn = conectar()
                cursor = conn.cursor()

                cursor.execute(
                    "SELECT funcionarios.nome, dependentes.nome FROM funcionarios join dependentes on funcionarios.idFuncionarios = dependentes.idFuncionarios ")
                dependentesFuncionario = cursor.fetchall()

                if len(dependentesFuncionario) > 0:
                    print('Lista de dependentes dos funcionarios')
                    print('----------------')
                    for dependente in dependentesFuncionario:
                        print(f'NOME DO RESPONSAVEL: {dependente[0]}')
                        print(f'NOME DO DEPENDENTE: {dependente[1]}')

                        print('----------------')
                else:
                    print('Não existe dependentes cadastrados')

            """
            Função para gerar o menu inicial
            """
            print('========= Gerenciamento de Dependentes ==============')
            print('Selecione uma opção: ')
            print('1 - Listar Dependentes.')
            print('2 - Inserir Dependentes.')
            print('3 - Atualizar Dependentes.')
            print('4 - Deletar Dependentes.')
            print('5 - Juntar com tabela funcionario')

            opcaoDependente = int(input('Digite sua opção: '))
            if opcaoDependente in [1, 2, 3, 4, 5]:
               if opcaoDependente == 1:
                  listarDependente()
               elif opcaoDependente == 2:
                  inserirDependente()
               elif opcaoDependente == 3:
                  atualizarDependente()
               elif opcaoDependente == 4:
                  deletarDependentes()
               elif opcaoDependente == 5:
                  juntarDependente()
               else:
                  print('Opção inválida')
            else:
               print('Opção inválida')


        else:
            print('Opção inválida')
    else:
        print('Opção inválida')

