unit SORM.Model.Conexao.Firedac.Conexao;

interface

uses
  SORM.Model.Conexao.Interfaces, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB;

Type
  TModelConexaoFiredac = class(TInterfacedObject, IModelConexao)
  private
    FConexao : TFDConnection;
  public
    constructor Create();
    destructor Destroy; override;
    class function New: IModelConexao;
    function Connection: TCustomConnection;
    function Firedac   : TFDConnection;
  end;

implementation

uses
  System.SysUtils;

{ TModelConexaoFiredac }
function TModelConexaoFiredac.Connection: TCustomConnection;
begin
   Result := FConexao;
end;

constructor TModelConexaoFiredac.Create;
begin
   FConexao := TFDConnection.Create(nil);
   FConexao.Params.DriverID := 'FB';
   FConexao.Params.Database := 'D:\Usr\React\Database\SITE.FDB';
   FConexao.Params.UserName := 'SYSDBA';
   FConexao.Params.Password := 'masterkey';
   FConexao.Connected := True;
end;

destructor TModelConexaoFiredac.Destroy;
begin
  FreeAndNil(FConexao);
  inherited;
end;

function TModelConexaoFiredac.Firedac: TFDConnection;
begin
   Result := TFDConnection(FConexao);
end;

class function TModelConexaoFiredac.New: IModelConexao;
begin
  result := Self.Create;
end;

end.
