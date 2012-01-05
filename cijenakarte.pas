unit CijenaKarte;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,ZDataset;

  procedure izracunaj(VoznaKartaID,StupacID,ODPostajeID,DoPostajeID:Integer;datum:TDateTime);
  function izracunPopustaKarte(query1:TZReadOnlyQuery;VrstaPopustaID:Integer; CijenaKarte:double):double;
  function tarifnaCijenaCjenika(query1:TZReadOnlyQuery;TarifniCjenikID,ZaKM:Integer; Datum:TDateTime): double;
  function distancaVarijante(query1:TZReadOnlyQuery;VarijantaID,ODPostajeID,DoPostajeID:Integer):Integer;

implementation

procedure izracunaj(VoznaKartaID,StupacID,ODPostajeID,DoPostajeID:Integer;datum:TDateTime);
begin
// SELECT * FROM PTKTVozneKarte WHERE ID = VoznaKartaID
// SELECT * FROM PTStupciVR WHERE ID = StupacID
//KMLinije := FullDistancaVarijante(VarijantaID);
// Odredi domaće i strane kilometre
// Ako je fiksna cijena karte
//  izračunaj kilometre za cjenik i izvadi cijenu iz karte
// Ako su fiksni kilometri izvadi kilometre iz karte

end;

function distancaVarijante(query1:TZReadOnlyQuery;VarijantaID,ODPostajeID,DoPostajeID:Integer):Integer;
var OdZapSt,DoZapSt,TempZapSt:Integer;
begin
   query1.SQL.Clear;
   query1.SQL.Add('SELECT PVar.ZapSt FROM PTPostajeVarijantVR PVar,PTPostajeVR PVR ');
   query1.SQL.Add('WHERE PVR.ID = PVar.NodePostajeVRID AND PVar.VarijantaID = :Varijanta ');
   query1.SQL.Add('AND PVR.PostajaID = :PostajaID ORDER BY 1 LIMIT 1');
   query1.ParamByName('Varijanta').AsInteger := VarijantaID;
   query1.ParamByName('PostajaID').AsInteger := OdPostajeID;
   query1.Open;
   OdZapSt := query1.FindField('ZapSt').AsInteger;
   query1.Close;
   query1.ParamByName('PostajaID').AsInteger := DoPostajeID;
   query1.Open;
   DoZapSt := query1.FindField('ZapSt').AsInteger;
   query1.Close;
   if OdZapSt > DoZapSt then
      begin
      TempZapst := OdZapSt;
      OdZapSt := DoZapSt;
      DoZapSt := TempZapSt;
      end;
   query1.SQL.Clear;
   query1.SQL.Add('SELECT SUM(a.DistancaM) Metara FROM PTPostajeVarijantVR a ');
   query1.SQL.Add('WHERE a.VarijantaID = :Varijanta AND a.ZapSt > :OdZapSt ');
   query1.SQL.Add('AND a.ZapSt <= :DoZapSt AND a.Vozel IN  (SELECT Vozel  FROM PTPostajeVarijantVR b ');
   query1.SQL.Add('WHERE b.VarijantaID = a.VarijantaID AND (b.ZapSt = :OdZapSt1 OR B.ZapSt = :DoZapSt1))');
   query1.ParamByName('Varijanta').AsInteger := VarijantaID;
   query1.ParamByName('OdZapSt').AsInteger := OdZapSt;
   query1.ParamByName('DoZapSt').AsInteger := DoZapSt;
   query1.ParamByName('OdZapSt1').AsInteger := OdZapSt;
   query1.ParamByName('DoZapSt1').AsInteger := DoZapSt;
   query1.Open;
   Result := query1.FindField('Metara').AsInteger;
end;

function izracunPopustaKarte(query1:TZReadOnlyQuery;VrstaPopustaID:Integer; CijenaKarte:double):double;
begin
   query1.SQL.Clear;
   query1.SQL.Add('SELECT NacinIzracuna, Vrednost FROM PTKTVrstePopustov WHERE ID = :VrstaPopustaID');
   query1.ParamByName('VrstaPopustaID').AsInteger:= VrstaPopustaID;
   query1.Open;
   if query1.EOF then
      Result := 0
   else begin
      if query1.FindField('NacinIzracuna').AsInteger = 0 then
         Result := CijenaKarte * query1.FindField('Vrednost').AsFloat / 100
      else
        Result := query1.FindField('Vrednost').AsFloat;
   end;
   query1.Close;
end;

function tarifnaCijenaCjenika(query1:TZReadOnlyQuery;TarifniCjenikID,ZaKM:Integer; Datum:TDateTime): double;
begin
   query1.SQL.Clear;
   query1.sql.add('SELECT TC.Cena FROM PTKTTarifniRazrediCenik TC ');
   query1.sql.add('WHERE TC.IDRazreda=:TarifniCenikID AND TC.VeljaOd <= :Datum ');
   query1.sql.add('AND TC.OdKM <= :ZaKM ORDER BY TC.VeljaOd DESC, TC.OdKM DESC LIMIT 1');
   query1.ParamByName('TarifniCenikID').AsInteger:= TarifniCjenikID;
   query1.ParamByName('Datum').AsDate:= Datum;
   query1.ParamByName('ZaKM').AsInteger:= ZaKM;
   query1.Open;
   Result := query1.FindField('Cena').AsFloat;
   query1.Close;
end;

end.

