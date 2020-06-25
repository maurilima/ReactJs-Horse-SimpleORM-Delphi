unit SORM.Model.DAOGeneric;

interface

  uses
      System.JSON,
      REST.Json,
      SORM.Model.Conexao.Firedac.Conexao,
      SimpleInterface,
      SimpleDAO,
      SimpleAttributes,
      SimpleQueryFiredac,
      Data.DB,
      SORM.Model.Conexao.Interfaces,
      DataSetConverter4D,
      DataSetConverter4D.Helper,
      DataSetConverter4D.Impl,
      DataSetConverter4D.Util;

  type
     iDAOGeneric<T: class> = interface
       ['{D6FFF10E-60F7-4FCF-BC2D-96A19451BF8B}']
       function Find : TJSONArray; overload;
       function Find (const ID : Integer): TJSONObject; overload;
       function Insert(const aJsonObjet : TJSONObject): TJSONObject;
       function Update(const aJsonObject : TJSONObject) : TJSONObject;
       function Delete(aField : string; aValue : string ): TJSONObject; overload;

     end;

     TDAOGeneric<T: class, constructor> = class(TInterfacedObject, iDAOGeneric<T>)
     private
        FConn: ISimpleQuery;
        Fconexao : iModelConexao;
        FDAO : iSimpleDAO<T>;
        FDataSource : TDataSource;
     public
       constructor Create;
       destructor Destroy ; override;
       class function New : iDAOGeneric<T>;
       function Find : TJSONArray; overload;
       function Find (const ID : Integer):TJSONObject; overload;
       function Insert(const aJsonObjet : TJSONObject): TJSONObject;
       function Update(const aJsonObject : TJSONObject) : TJSONObject;
       function Delete(aField : string; aValue : string ): TJSONObject; overload;
     end;

implementation

{ TDAOGeneric<T> }

constructor TDAOGeneric<T>.Create;
begin
    FDataSource := TDataSource.Create(nil);
    Fconexao := TModelConexaoFiredac.New;
    FConn := TSimpleQueryFiredac.New(Fconexao.Firedac);
    FDAO  := TSimpleDAO<T>.New(FConn).DataSource(FDataSource);
end;

function TDAOGeneric<T>.Delete(aField: string; aValue: string): TJSONObject;
begin
   FDAO.Delete(aField,aValue) ;
   Result := FDataSource.DataSet.AsJSONObject;
end;

destructor TDAOGeneric<T>.Destroy;
begin
  FDataSource.Free;
  inherited;
end;

function TDAOGeneric<T>.Find(const ID: Integer): TJSONObject;
begin
   FDAO.Find(ID);
   Result := FDataSource.DataSet.AsJSONObject;

end;

function TDAOGeneric<T>.Find: TJSONArray;
begin
   FDAO.Find;
   Result := FDataSource.DataSet.AsJSONArray;
end;

class function TDAOGeneric<T>.New: iDAOGeneric<T>;
begin
   Result := Self.Create;
end;

function TDAOGeneric<T>.Insert(const aJsonObjet: TJSONObject): TJSONObject;
begin
  FDAO.Insert(TJson.JsonToObject<T>(aJsonObjet));
  Result := FDataSource.DataSet.AsJSONObject;
end;

function TDAOGeneric<T>.Update(const aJsonObject: TJSONObject): TJSONObject;
begin
  FDAO.Update(TJson.JsonToObject<T>(aJsonObject));
  Result := FDataSource.DataSet.AsJSONObject;

end;

end.
