unit SORM.Model.Conexao.Firedac.Query;

interface

uses
  SORM.Model.Conexao.Interfaces, Data.DB, Firedac.Stan.Intf,
  Firedac.Stan.Option, Firedac.Stan.Param,
  Firedac.Stan.Error, Firedac.DatS, Firedac.Phys.Intf, Firedac.DApt.Intf,
  Firedac.Stan.Async,
  Firedac.DApt, Firedac.Comp.DataSet, Firedac.Comp.Client;

Type
  TModelConexaoFiredacQuery = class(TInterfacedObject, ImodelQuery)
  private
    FQuery: TFDQuery;
    FConn : iModelConexao;
  public
    constructor Create(Value: iModelConexao);
    destructor Destroy; override;
    class function New(Value: iModelConexao): ImodelQuery;
    function Query: TObject;
    function OpenTable(Table: string): ImodelQuery;

  end;

implementation

uses
  System.SysUtils;

{ TModelConexaoFiredacQuery }
constructor TModelConexaoFiredacQuery.Create(Value: iModelConexao);
begin
  FConn := Value;
  FQuery := TFdQuery.Create(nil);
  FQuery.Connection := TFDConnection(FConn.Connection);
end;

destructor TModelConexaoFiredacQuery.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

class function TModelConexaoFiredacQuery.New(Value: iModelConexao): ImodelQuery;
begin
  result := Self.Create(Value);
end;

function TModelConexaoFiredacQuery.OpenTable(Table: string): ImodelQuery;
var
   SQL : string;
begin
  result := Self;
  SQL := 'SELECT * FROM '+ Table;
  FQuery.SQL.Add(SQL);
  FQuery.Open;
end;

function TModelConexaoFiredacQuery.Query: TObject;
begin
  result := FQuery;
end;

end.
