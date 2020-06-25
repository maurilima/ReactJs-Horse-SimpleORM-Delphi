unit SORM.Model.Conexao.Interfaces;

interface

uses
  Data.DB, FireDAC.Comp.Client;

type

  iModelConexao = interface
    ['{EA2113CF-7092-48E2-8D45-21D1B9A34B8B}']
    function Connection: TCustomConnection;
    function Firedac   : TFDConnection;

  end;

  iModelQuery = interface
    ['{82240D22-F80E-41AE-9C80-0BA1F3D25A52}']
    function Query: TObject;
    function OpenTable(Table: string): iModelQuery;
  end;

  iModelConexaoFactory = interface
    ['{F0A27B3C-C783-415D-9E9B-D2B6DD599C5E}']
    function Conexao : iModelConexao;
    function Query   : iModelQuery;

  end;
implementation

end.
