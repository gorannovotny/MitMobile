SELECT * FROM PTVarijanteVR
WHERE PTVarijanteVR.VozniRedID NOT IN( SELECT ID FROM PTVozniRedi);
DELETE FROM PTVarijanteVR
WHERE PTVarijanteVR.VozniRedID NOT IN( SELECT ID FROM PTVozniRedi);

SELECT COUNT(*) FROM PTStupciVR WHERE PTStupciVR.VarijantaVRID NOT IN
 ( SELECT ID FROM PTVarijanteVR);
DELETE FROM PTStupciVR WHERE PTStupciVR.VarijantaVRID NOT IN
 ( SELECT ID FROM PTVarijanteVR);
 
SELECT COUNT(*) FROM PTPostajeVarijantVR WHERE PTPostajeVarijantVR.VarijantaID NOT IN 
  (SELECT ID FROM PTVarijanteVR);
DELETE FROM PTPostajeVarijantVR WHERE PTPostajeVarijantVR.VarijantaID NOT IN 
  (SELECT ID FROM PTVarijanteVR);

SELECT COUNT(*) FROM PTPostajeVR WHERE PTPostajeVR.VozniRedID NOT IN 
 (SELECT ID FROM PTVozniRedi);
DELETE FROM PTPostajeVR WHERE PTPostajeVR.VozniRedID NOT IN 
 (SELECT ID FROM PTVozniRedi);
 
DELETE FROM PTPostaje WHERE ID NOT IN 
  (SELECT PTPostajeVR.PostajaID FROM PTPostajeVR GROUP BY 1);
 
SELECT COUNT(*) FROM PTCasiVoznjeVR WHERE PTCasiVoznjeVR.StupacVRID NOT IN
 ( SELECT ID FROM PTStupciVR);
DELETE FROM PTCasiVoznjeVR WHERE PTCasiVoznjeVR.StupacVRID NOT IN
 ( SELECT ID FROM PTStupciVR);
 
SELECT * FROM PTStupciVR;
SELECT ptpostajevarijantvr.id,PTPostajeVR.ZapSt,ptpostaje.naziv,PTPostajeVR.DistancaM FROM PTPostaje,PTPostajeVR,PTPostajeVarijantVR,PTVarijanteVR,PTStupciVR
WHERE PTPostajeVR.postajaid = PTPostaje.id
AND   PTPostajeVarijantVR.NodePostajeVRID = PTPostajeVR.ID
AND   PTVarijanteVR.id = PTPostajeVarijantVR.VarijantaID
AND   PTStupciVR.VarijantaVRID = PTVarijanteVR.id
AND   PTStupciVR.ID = 24886
ORDER BY 1;
SELECT * FROM PTPostajeVarijantVR ;
SELECT * FROM PTKTVozneKarte;

