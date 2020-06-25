unit SORM.Model.Conexao.Factory;

interface

uses
  SORM.Model.Conexao.Interfaces;

Type
  TModelConexaoFactory = class(TInterfacedObject, IModelConexaoFactory)
  private
  public
    constructor Create();
    destructor Destroy; override;
    class function New: IModelConexaoFactory;
    function Conexao : iModelConexao;
    function Query   : iModelQuery;
  end;

implementation

uses
  SORM.Model.Conexao.Firedac.Conexao, SORM.Model.Conexao.Firedac.Query;

{ TModelConexaoFactory }
function TModelConexaoFactory.Conexao: iModelConexao;
begin
   Result := TModelConexaoFiredac.New;
end;

constructor TModelConexaoFactory.Create;
begin
end;

destructor TModelConexaoFactory.Destroy;
begin
  inherited;
end;

class function TModelConexaoFactory.New: IModelConexaoFactory;
begin
  result := Self.Create;
end;

function TModelConexaoFactory.Query: iModelQuery;
begin
   Result := TModelConexaoFiredacQuery.New(Self.Conexao);
end;

end.
