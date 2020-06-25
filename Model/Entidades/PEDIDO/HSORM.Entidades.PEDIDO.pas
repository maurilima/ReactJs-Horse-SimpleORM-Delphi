{
Gerador de classes para SIMPLEORM
Desenvolvido por Alan Petry - APNET INFORMATICA LTDA
Fone: (54)98415-0888
Email: alanpetry@alnet.eti.br ou alanpetry@outlook.com
}


unit HSORM.Entidades.PEDIDO;

interface

uses
  System.Generics.Collections, System.Classes, Rest.Json, System.JSON, SimpleAttributes;

type
  [Tabela('PEDIDO')]
  TPEDIDO = class
  private
    FID: integer;
    FNOME: string;
    FVALOR: real;
    FDATA: TDate;
    procedure SetDATA(const Value: TDate);
    procedure SetID(const Value: integer);
    procedure SetNOME(const Value: string);
    procedure SetVALOR(const Value: real);
  public
    constructor Create;
    destructor Destroy; override;

  published
{verificar os atributos do campo de chave primária}
{Exemplo: [Campo('NOME_CAMPO'), PK, AutoInc] }
    [Campo('ID'), PK]
    property ID: integer read FID write SetID;
    [Campo('NOME')]
    property NOME: string read FNOME write SetNome;
    [Campo('DATA')]
    property DATA: TDate read FDATA write SetDATA;
    [Campo('VALOR')]
    property VALOR: real read FVALOR write SetVALOR;

    function ToJSONObject: TJsonObject;
    function ToJsonString: string;

  end;

implementation

constructor TPEDIDO.Create;
begin

end;

destructor TPEDIDO.Destroy;
begin

  inherited;
end;

procedure TPEDIDO.SetDATA(const Value: TDate);
begin
  FDATA := Value;
end;

procedure TPEDIDO.SetID(const Value: integer);
begin
  FID := Value;
end;

procedure TPEDIDO.SetNOME(const Value: string);
begin
    FNOME := Value;
end;

procedure TPEDIDO.SetVALOR(const Value: real);
begin
  FValor := Value;
end;

function TPEDIDO.ToJSONObject: TJsonObject;
begin
  Result := TJson.ObjectToJsonObject(Self);
end;

function TPEDIDO.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

end.
