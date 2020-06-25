unit HSORM.Controller.Contato;

interface

uses
  Horse,
  System.JSON, REST.Json,
  System.SysUtils, SORM.Model.DAOGeneric ;

procedure Registry(App: THorse);
procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure GetID(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Post(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Put(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc);


implementation

uses
  SORM.Model.Conexao.Interfaces,  SimpleInterface,
  HSORM.Entidades.PEDIDO,
  DataSetConverter4D,
  DataSetConverter4D.Helper,
  DataSetConverter4D.Impl,
  DataSetConverter4D.Util ;

procedure Registry(App: THorse);
begin
  App.Get('/pedido', Get);
  App.Get('/pedido/:id', GetID);
  App.Post('/pedido', Post);
  App.Put('/pedido', Put);
  App.Delete('/pedido/:aField/:id', Delete);
end;

procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  FDAO : iDaoGeneric<TPEDIDO>;
begin
  FDAO := TDaoGeneric<TPEDIDO>.New;
  Res.Send(FDAO.Find);
end;

procedure GetID(Req: THorseRequest; Res: THorseResponse; Next: TProc);
Var
  FDao: iDAOGeneric<TPedido>;
begin
    FDao        := TDAOGeneric<TPedido>.New;
    Res.Send<TJSONObject>(FDao.Find(Req.Params.Items['id'].ToInteger));

end;

procedure Post(Req: THorseRequest; Res: THorseResponse; Next: TProc);
Var
  FDao: iDAOGeneric<TPedido>;
  fPedido    : TPEDIDO;
begin
  FormatSettings.DateSeparator := '.';
  try
    fPedido     := TPEDIDO.Create;
    fPedido := TJson.JsonToObject<TPedido>(Req.Body<TJSONObject>);

    fPedido.DATA := StrToDate(StringReplace(Req.
                        Body<TJSONObject>.
                          GetValue('DATA').
                             ToString,'"','',[rfReplaceAll]));

    FDao        := TDAOGeneric<TPedido>.New;

    FDao.Insert(fPedido.ToJSONObject);
    Res.Send<TJSONObject>(FDao.Find(fPedido.ID));

  finally
    FormatSettings.DateSeparator := '/';
    FreeAndNil(fPedido);
  end;
end;

procedure Put(Req: THorseRequest; Res: THorseResponse; Next: TProc);
Var
  FDao: iDAOGeneric<TPedido>;
  fPedido    : TPEDIDO;
begin
  FormatSettings.DateSeparator := '.';
  try
    fPedido     := TPEDIDO.Create;
    fPedido := TJson.JsonToObject<TPedido>(Req.Body<TJSONObject>);
    {
    ------------------------------------------------------------------------
    Formato Date Deve ser Tratado aqui.
     Criar Metodo para Tratar quando e enviado com separador "/" "-" "."
     Delphi ler a data com aspas duplas. por isso nao Seta a data corredamente no TPedido
     por causa disso data e corrigida pra fazer a conversao corretamente
     --------------------------------------------------------------------------
     }
    fPedido.DATA := StrToDate(StringReplace(Req.
                        Body<TJSONObject>.
                          GetValue('DATA').
                             ToString,'"','',[rfReplaceAll]));
    FDAO := TDAOGeneric<TPEDIDO>.New;
    FDao.Update(fPedido.ToJSONObject);
    ;
    Res.Send<TJSONObject>(FDao.Find(fPedido.ID));
  finally
    FormatSettings.DateSeparator := '/';
    FreeAndNil(fPedido);
  end;

end;

procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc);
Var
  FDao: iDAOGeneric<TPedido>;
begin
  try
   FDao := TDAOGeneric<TPEDIDO>.New;
   FDao.Delete(Req.Params.Items['aField'],Req.Params.Items['id']);
   Res.Send('[{"Result" : "OK"}]');
  finally

  end;

end;

end.
