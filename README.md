# String Heroes
Work done for the subject of Project 1 of the SMD course (UFC)

Status do projeto: Em desenvolvimento ⚠️
> Versão atual: 0.1.5

## Objetivo do projeto:
O principal objetivo da aplicação é proporcionar uma opção de ensino que atenda às necessidades tanto do cliente, que possui dificuldades quanto ao acompanhamento dos alunos e de materiais voltados para crianças, como dos alunos em si, os quais necessitam de conteúdos que possam ser aproveitados além dos acompanhamentos nas aulas e de forma atrativa.

<img src="https://user-images.githubusercontent.com/51689397/125649348-f4d941a0-efae-4312-a34e-64fdbceb596c.png" width="136px" heigth="96px"></img>
## Integrantes da equipe Argonautas:
- José Carlos 
- Kayssar Amir
- Mauro Victor
- Nicolas Barbosa
- Vitor Santos

## Cliente do projeto:
- Professora Liu Man Ying, coordenadora do Curso de Ensino Coletivo de Cordas Friccionadas da UFC.

## Mapa de funcionalidades:
### Funções básicas:
<table>
  <tr> <td>Funções</td><td>Local</td> </tr>
  <tr> <td>RF_B1: Iniciar novo jogo </td><td>Menu.gd</td> </tr>
  <tr> <td>RF_B2: Escolha do modo de  jogo </td><td>GameSelector.gd && IconButtons.gd</td> </tr>
</table>

### Funções fundamentais:
<table>
  <tr> <td>Funções</td><td>Local</td> </tr>
  <tr> <td>RF_F1: Transição de telas </td><td>Control_view.gd && Camera.gd</td> </tr>
  <tr> <td>RF_F2: Modo história </td><td>HistoryMode.gd && Minigame1.gd && concerto.gd</td> </tr>
  <tr> <td>RF_F3: Jogo Quebra cabeças </td><td>OnlyPuzzle.gd</td> </tr>
  <tr> <td>RF_F4: Jogo Concerto </td><td>concerto.gd</td> </tr>
  <tr> <td>RF_F5: Sistema de pause </td><td>Pause.gd</td> </tr>
  <tr> <td>RF_F6: Histórico de diálogos </td><td>DialogHistoric.gd </td> </tr>
</table>

### Funções de saída:
<table>
  <tr> <td>Funções</td><td>Local</td> </tr>
  <tr> <td>RF_S1: Sistema de diálogos </td><td> Dialog.gd && ( DialogPopup.gd || DialogNovel.gd ) </td> </tr>
  <tr> <td>RF_S2: Sair do jogo e voltar ao menu </td><td> Pause.gd && Control_view.gd </td> </tr>
</table>
