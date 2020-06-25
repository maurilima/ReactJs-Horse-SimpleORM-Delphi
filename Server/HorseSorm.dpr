program HorseSorm;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  Horse.CORS,
  System.JSON,
  HSORM.Controller.Contato in '..\Controller\HSORM.Controller.Contato.pas',
  SORM.Model.Conexao.Factory in '..\Model\Conexao\SORM.Model.Conexao.Factory.pas',
  SORM.Model.Conexao.Firedac.Conexao in '..\Model\Conexao\SORM.Model.Conexao.Firedac.Conexao.pas',
  SORM.Model.Conexao.Firedac.Query in '..\Model\Conexao\SORM.Model.Conexao.Firedac.Query.pas',
  SORM.Model.Conexao.Interfaces in '..\Model\Conexao\SORM.Model.Conexao.Interfaces.pas',
  HSORM.Entidades.PEDIDO in '..\Model\Entidades\PEDIDO\HSORM.Entidades.PEDIDO.pas',
  SORM.Model.DAOGeneric in '..\Model\SORM.Model.DAOGeneric.pas';

var
  App : THorse;

begin
  App := THorse.Create(9000);
  App.Use(Jhonson);
  App.Use(CORS);
  HSORM.Controller.Contato.Registry(App);


  App.Start;

end.
