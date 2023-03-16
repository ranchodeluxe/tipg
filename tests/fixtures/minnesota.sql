SET standard_conforming_strings = OFF;
DROP TABLE IF EXISTS "public"."minnesota" CASCADE;
BEGIN;
CREATE TABLE "public"."minnesota" ( "ogc_fid" SERIAL, CONSTRAINT "minnesota_pk" PRIMARY KEY ("ogc_fid") );
SELECT AddGeometryColumn('public','minnesota','geom',26915,'MULTIPOLYGON',2);
CREATE INDEX "minnesota_geom_geom_idx" ON "public"."minnesota" USING GIST ("geom");
ALTER TABLE "public"."minnesota" ADD COLUMN "name" VARCHAR(24);
INSERT INTO "public"."minnesota" ("geom" , "name") VALUES ('010600002023690000010000000103000000010000000801000060423E6810EC1A418C855AEFBDDE5341B0529621D0F91A41AC6054DAB1DE5341502EFF210C131B41D6C56DD8A9DE5341F08E5334382C1B41B8B88D96A3DE534150A60A4658451B417EF2B0D499DE534120BE305910621B412ED49A1288DE534140431C6B1C7B1B41A89BC4907FDE5341B0B6627FE8931B41D400DE8E86DE5341302AA993F8AC1B41B27BF24C8DDE5341D0AF03A7E4C51B412CCB100B8FDE534180226CB854DE1B4114AE470986DE5341809543CBC4F71B418AFD654781DE534190635DDCB4101C415627A08572DE5341800D4FEFFC291C41A8BDC1436FDE5341905AD3FC00431C41D0DEE0BF6CDE534100143F06B95B1C41E0E00B7B61DE5341704DF30E45741C41384547F650DE5341502CD41A758F1C414660E5F04EDE5341101DC92565A81C41FC87F4EB4DDE534190B20C3135C11C41049A08274FDE534150DA1B3C75DA1C414CA60AE24CDE534120022B4761F31C4178711B5D4CDE5341C0605452690C1D41C4F528184BDE53414075025AE1251D41801D38532EDE534180AEB662113F1D41AAE848CE1ADE5341201FF46C41581D413CDF4F0912DE5341F00DBE7091701D41A445B68705DE5341206A4D730D891D41548D97C6F5DD534120EBE276A9A11D4146477285EDDD53419036AB7E3DC41D41F0A7C683F7DD5341B05CFE8341DD1D41744694C2FCDD53415027A08965F61D41ACFA5CC104DE53414004568EFD0F1E415452278004DE5341C0172693F5281E41B837F8BE05DE5341E03D79980D421E413AD6C57D0BDE5341B079C7697D411E412ACB10BF79DC5341006D563DF1401E41728A8E40E6DA534150AD691E89401E4170C5FE0258D95341706DC5FE54401E416E787AC5BFD7534100098ADFEC3F1E416AB3EA872FD65341801283C0CC3F1E41AC6054CAA0D45341E02D90A0203F1E41CECCCC8C0AD3534160378981303F1E41A4D634CF7BD1534160F7E461903E1E415427A091EBCF534110DCD7413C3E1E412AA9135454CE5341D0529621583D1E414A9D8056C1CC534190B74002F03C1E418AD2DE5836CB5341C04082E28B3C1E4138AB3E1BA8C95341405C8FC23F3C1E410CB5A65D14C85341C02E6EA3233C1E41945CFEDF8AC65341304A7B83B33B1E4142355EA2FBC45341809CA263CB3B1E41163FC66465C3534160DC46431B3B1E410E8A1F67D7C15341406519221B3A1E418E3177E947C053413085EB117F391E417EF2B0E8B4BE534160A60A0677391E413E1361A72CBD5341F0FDD4F8EA381E41961804A697BB5341D0E76AEB5A381E41E81DA7E401BA5341608863DD6E371E41186A4D6372B853414085EBD1C2371E4126FDF661E4B65341F09387C5BA371E4176029A604EB5534170FE43BA22381E41A84E40DFBFB35341300DE0AD0E381E41FC53E3DD2CB25341308A1FA3A6381E414C59869C9CB0534110D044982A391E410C4625290BAF534130575BB1D6421E414C0C024F0AAF534190AEB6A296411E41E6839E5976AD534150621098EA411E41EA2631D8DFAB534130287E8CDA411E41F0C9C3D648AA5341C0490C820A421E41D62B6595C3A8534150B4C8760E421E4128B9FCD333A75341A0438B6C6A421E4150158C529FA55341900F7A7676421E4170F0851108A45341B0BB969042421E41AE8BDB1077A25341207A36AB2E421E4112E02D90E5A05341C001BCC512421E416E34800F539F534120AE47E112421E411AFBCBCEB79D5341B011A5FD66421E41521E164E219C5341502CD41A1F431E411E9E5E0D949A5341607DAE3653431E4154C1A88CFF985341504ED1515B431E416C2BF60B6F9753410032E66ECB431E41ECC039CBD695534170158C8ADB431E41B640820A41945341201DC9A5E3431E41F263CCC9AF925341701283C0CB431E412C8716C91D915341E0ACFADC2F441E411AC05B888F8F5341704694F6C3431E41302AA947FC8D5341C0726811A8431E41FEA9F186698C5341E0D5562C6C431E415A8638C6CD8A534140234A3B38431E41E661A14643895341203411366C431E415C204149B2875341D056EC2F6C431E41FC0FE9CB1E865341309E5E294C431E414C158C8E8E845341C02E6E2358431E41A01A2FD1FC825341B0D1001E8C431E411AD9CE936A81534120E2581768431E41226C7896D57F5341E0EEC9C36B2A1E41A03C2CD8D47F5341A0C420706B111E4142C6DC19D77F5341802BF6170FF71D4156E3A5DBD87F534170F085C996DF1D415E20415DD87F5341A0218E757AC61D41B637F81EDA7F534130E4831E86AC1D41EC95B260E27F5341E0F0F4CA89931D41B0506B62E27F5341A00F7A76597A1D4132211FE4E87F534190D2DE20D9601D41647FD925EE7F5341E00968E2A4471D413090A0A8F67F5341907CD0B3B02E1D4130211FACFD7F534150014D84A4141D41D4DEE0AFF27F5341A006F05680FB1C412C3A92B3D97F5341D054C1281CE21C41A44E40B7C67F5341205A64FB1FC91C41B247E1BAAF7F5341509621CE4BB01C41B4C8763E997F5341B0BFEC9E7F961C41C4B12E027F7F534150E8D96C877B1C416AE7FB45777F5341F053E365C77D1C41B8847CC4FA805341D0073D5B637E1C419E5E29038D825341A0CDAA4F577E1C4148B6F3C11A845341C025E443277E1C413AF8C280A8855341F0460338DB7D1C41762497FF34875341508B6C27B37D1C4144C6DCFD70895341F0DBD70147641C41D609688286895341E09AE6DD7A4B1C41F831E6C687895341404772B96A321C4120D26F8B8B895341F051B89E7A191C41AED85F4E98895341E002098ABE011C41D6C56D509C89534170423EA8A4FF1B4154499DCC9B895341504547724AE61B413A2CD49295895341D0E3145DBACD1B41DAACFA948E8953414094F64636B41B41801D389787895341700D4F2FDA981B415227A0597F8953412063EE1A52811B41EEB7AF1B7D8953413093A90242651B410C24289E77895341B0559FEB994A1B417012836070895341608638D6CD311B41A267B3A26A89534180C954C1B1191B41865AD32468895341203108AC05011B41B6AF03E761895341D0490C82B5E81A41C4B12EAA5C89534100BC055291CF1A41C442ADED5789534110B7D1407FC51A41168C4A0658895341A0081BDE41C51A4176F90F616889534130F6975D12C51A416E3D0AFF7D895341F0ACFA1CD8C41A41029A08478D895341F0C7983B52C41A41B6F3FDD0C08953419075715B48C41A41B6F3FDB4C2895341009A089B21C41A414A50FCD0CE895341F0EBC0F981C31A41009A0857E18953413090A0F8F4C21A419E2A1865E8895341A01804D6A6C11A41CEC342F9EE89534170B3EAF389C01A41D6E76A3BED895341C069DEF176BF1A4152AF9459E8895341C096908F2FBE1A41161DC9D5DB89534140E8D96CAABC1A414CA60A0EC9895341303A92CB07BC1A419CC42084C889534160A60A8639B91A414AE17A64DB89534170DC4683D8B71A41C4A8A4DEEA89534110AE4721E7B61A41363CBD3EFA895341F0FFFFFF46B61A416029CB20098A534100098A9F14B61A415EE5D0A20C8A5341606DC5FEBAB51A411873D7A2168A5341B0081B9E5DB51A4168D5E7961C8A5341F0ACFA1CB6B41A4126530547278A534140D1911C7AB41A412CCB10A72D8A5341909A771C5CB41A4152B81E65408A534130A089F017B41A419C081BDA678A5341202DB21D3DB41A41E0938771F68A5341E01B7C21A9B41A4140BD5272878C5341A041602515B51A412E431CB3198E534160302A2979B51A418C6CE773AA8F534100560E2DE5B51A415839B4B44391534160696F300DB61A41E0938735D6925341B045B63325B61A41F64A593667945341F058173741B61A41EA482EF7FC955341F0D9AC3A85B61A41DACEF7F78B975341A036AB3E09B71A4112C7BA381F99534190B7404259B71A41044D8439B09A53419038D645A1B71A41188C4A7A3D9C534140A7E84875B71A41C41726BBD49D534180832F4C75B71A414A72F93B6A9F5341C096904F79B71A41F285C9FCFDA0534110AAF1527DB71A41083D9BFD92A253410074B55519B71A416CDE717E17A45341A053746405B71A41703D0AFFB1A55341D0A8A48E7DB81A4142A4DFBE43A7534190EB51B835B91A4162E5D0FED8A85341E02D90E04DB91A413E2CD4FE65AA534180FE43FA4DB91A418C16D9B264AB53417027A0094EB91A41F6B9DA7EFCAB53419065882337B91A41AE47E1AEFDAC5341600E2D322AB91A418A8EE4FE8EAD5341D06F5F0749B91A4120EBE2C65FAE5341F02631C862BA1A411483C0FE5FAE53417017B7D14AC41A4154AF94BD76AE5341A0EA73B592C81A41061214337EAE5341704F1E1650C91A414A50FC7C7FAE534160621018AECA1A41885AD30C89AE5341306EA3C175D11A41E0020972B8AE5341E00968A212D21A41DACEF7BBBCAE5341F09E3C2C75D81A415A643BFBF2AE5341E0D5566CC0D91A41986E12FBEAAE5341F05F76CFE3D91A4150840DF3E5AE534180567D2EA1DD1A4156499D78E4AE53412097FF902BE11A415ACA322CE4AE534160B1BFECB2E11A4154962176E4AE534100EEEB00CEE11A417C832FB886AF534170840D8FE6E11A41C6293AFA19B05341608B6CE7CFE11A41643255401AB153418058A8B5C2E11A418A1F63FAAEB15341104D844D9BE11A4128287E48A9B25341B02C43DC82E11A41285C8FBA44B35341808FC2F5B4E11A413290A0F84DB45341C037F802CFE11A410C93A9BAD7B45341A02C43DCE9E11A41CC98BBF2DFB55341E054C128F7E11A415A6DC5BA62B653411093A9824FE21A4118B7D10C70B75341D096904F7BE21A418816D9BAF5B7534100DE02C9C5E21A41B003E728FFB8534140C6DC75EBE21A41B2BFEC3A85B95341A016D98E67E31A4192C2F56C89BA5341401AC09BA7E31A4126DBF9BA0FBB5341F07C3FF5F3E31A4198F606271ABC5341405C8FC21BE41A41BE270F3BA5BC534100917E7B71E41A41BE9F1AD3A9BD534190C2F5E89FE41A41782D213B37BE534190C95441F6E41A417CA52CF335BF534110295C0F28E51A41363333FBC8BF534130287ECC2AE51A413680B73CCFC05341B0C8763E2CE51A41C439233A5BC1534170499D00B3E51A416EC5FE6A65C25341500E2D72F8E51A4122386778EEC2534110BC05526FE61A41AC3E57D7E6C3534130E6AEA5B8E61A41587DAEF67FC45341606FF0C518E71A41BE0E9CCF7BC5534190E2C7D850E71A414A50FCB40EC6534140477239A2E71A4168F7E4410EC7534160BA490CD1E71A41F0384533A1C7534100560EAD20E81A41C6B12E42A1C85341B0B6623F4DE81A41746891B130C95341D064AA6093E81A416E9A77B034CA5341D020B072B9E81A41F697DDEFC1CA5341D0B359F50AE91A41120BB52ED1CB5341101DC9A531E91A410E24282E52CC5341D042AD2945E91A41DAACFA1C6BCD5341B09999D94DE91A419053742CE7CD534170D1911CA4E91A4114AE4769F9CE5341C015FB0BCAE91A41EEC9C32A72CF5341D09F1A2F14EA1A41C05296BD85D05341D07F483F36EA1A412A0F0BA904D1534190779C626DEA1A4142C6DC9D19D25341F0E9957286EA1A41D0F7536797D253418058A8B596EA1A417AC729E6A9D35341609D80A69EEA1A419A9999652ED4534130C2862797EA1A4128E483AA30D55341908785DA92EA1A414282E2A3C5D55341506DC5FEDCEA1A4156C1A8D8E2D65341104D840DFBEA1A417CC7292256D753419004C58F39EB1A41DC68008F63D85341A048BF3D53EB1A41BEFC87E0D1D8534180AEB622B0EB1A413A6744E1F4D95341E00DBE70D3EB1A41A857CA5E63DA534170226CB82CEC1A419465882790DB5341F08C28AD4FEC1A4158A8351D06DC5341C0A44EC013EC1A4122B0720027DD5341C0FC87F4FBEB1A41E6AE255C99DD534160423E6810EC1A418C855AEFBDDE5341', 'Aitkin');
INSERT INTO "public"."minnesota" ("geom" , "name") VALUES ('01060000202369000001000000010300000001000000A1000000400AD7A3EF780F41A89BC40C69F05341E0627FD9E7AA0F41B42E6ECB5CF05341A004C50F68DD0F4178D7120A50F05341208A1F23F80710413680B74844F053411024283E38211041F6285C8735F05341B0627F59843A10412675028629F0534130211F748C531041E61DA7C416F0534130AB3E97507410418C8EE40203F05341A0A0F8B18C8D1041DE9387C1EFEF534100A8C6CBC4A610415E423E00E0EF534110098ADFE8BF1041840D4F3FD0EF534100A167F324D91041B0D85FFEBFEF534110022B0759F21041DCA3707DAFEF5341D03E571BD90C1141B40C71FC96EF5341E07A142EC12511417034803B7CEF53414080B740CD3E11414C158CBA5EEF534150E17A54F95711415427A03950EF5341900B2468FD701141C6DCB5B840EF53411048507C418A11413C92CBB735EF5341C096908F99A21141D478E9F628EF5341300AD7A3C1BB11412875027620EF5341307C61B265D41141EC7C3FF510EF534190900FBA29ED1141C6DCB53405EF5341D05B20C14506124154522774F1EE5341D08251C9491F12419C559FF3EBEE5341000534D11D38124176B515B3E2EE534110BE30D99D51124174CE8872D8EE5341209C33E2596B12416CE7FBB1D8EE534100D578E945841241D8A370F1C8EE5341A07BF2F05D9D1241D8BCE3F0B9EE5341D06B09F98DB61241407958B0B2EE534100EEEB0096CF1241AA35CD2FA8EE534130B9FC07D2E8124112F241EF95EE534120143F06C6011341081B9E6E8DEE534110363CFDC91A1341B0E1E92D7EEE5341D0FC87F4B53313415CA835ED71EE5341107A36EBA54C13417012832C60EE5341206519E2C165134118D9CE2B50EE5341D01951DAE17E134176B5152B4FEE53417017B7D1E59713411E7C612A44EE534110DE02C9E5B01341C442ADA939EE534140C9E5BF05CA13416E09F9E829EE534190FD65B755E313413A8941A821EE5341604469AF89FC134124C2866720EE5341A0E61DA7BD151441F241CF261AEE5341701B0DA0092F1441D42B65E510EE5341D0627F99554814413A92CB6308EE53411073D792C5611441C4B12E62FFED534170832F8C117B144198BB9620F6ED534140FAED6B757A1441248E75A161EC5341503A924B1D7914411E7C6162C9EA5341D01E852BFD771441F038456337E953414003780BF976144156522764A5E75341207A36EB4076144102DE026512E6534160CC5DCB2C751441F653E3E582E45341500C02AB54751441C420B066EFE2534170158C8A587514416E3480E75AE15341208C4A6A7074144188635D28C8DF534110CCEE498C731441A8923AE932DE534150B29D2FE472144188C954A9A4DC5341B087851A78711441A2ABADA807DB53413075021A047B14417A0B242806DB534150A60A06207A1441703480277ED9534100C58FF10B7914418A16D926E9D75341F0ACFADC977814410C2428E653D65341A0CB7FC80B781441FED478E5C0D45341807CD0B363771441F285C9642AD35341902D219F7B76144152DA1BE494D1534190DE718ACB7514416A4469E3FDCF534140B4C876EB741441F2C9C3E27BCE5341F0D24D625374144106341122EACC5341E0839E4D877314411C9E5E2154CB5341C06B0939577214417CF2B0A0C0C9534160C1A824C3711441945CFE1F30C8534110E02D10E3701441186A4D1FA0C6534100C898FB0A701441C030991E0EC55341E078E9E6E66E1441443EE8DD7AC35341F097DDD32A6E1441B27268DDE5C15341A026C2C6726D14410EB5A61D58C05341601058B9AA6C1441423EE89DBFBE5341F08E53B4AA53144180AEB69EC6BE5341F0164890FA3E144140136113CDBE5341704469EFAE3A1441064D8469CEBE5341108C4AAA2A2114413E795820D3BE534170C1A8A4FE071441EA8C28E1C5BE534140F6979D8EEF13419C9999E1D6BE53416086389606D71341BAD10022E7BE534160840D8F7AC013411C7C61A2EDBE5341605DDC8662A61341F641CFE2F5BE5341B0ED7C7F428D1341EAC039630BBF5341E0581777BA73134156E3A5A30ABF53416044696F6E5B1341E2BE0E6414BF5341408B6C67BE411341B4847CA41FBF534160643B5F2228134120A7E8E426BF53418019E258CE0E1341D2B359E555BF5341C0726851BEF512413CD6C5A566BF53417027A049BADC1241A0F831A672BF534130022B4752C31241BEC117E678BF53417093184422A812418C28EDE569BF534150EE5A42068F1241161DC9A574BF534180128340227612419E11A5E57CBF5341706DC53EFA5C12412406812588BF53417091ED3CD2431241B0FA5C6592BF534150234A3BCA2A124134EF38E59DBF534100ECC039DE1212419E2A1865ACBF5341C07D1D3882F9114190C2F5A4BABF5341900F7A366AE011418A5AD364C9BF534140D8F034F2C611417EF2B0E4DCBF534120A16733AAAD114176029AA4F0BF534120A089303A941141D4BCE3A403C053412044FA2D2E7B114132772D251BC0534140431C2BF661114100D578652CC05341800B24288E4811415E8FC2A53BC05341C0D32B257E2F114128ED0D664BC05341109C33226216114186A757E658C05341609B551F36FD10415605A3266DC0534190635D1C9EE41041B4BFEC667BC053419099991976CB10417E1D38278FC05341F061A11612B210414A7B83A7A2C05341402AA913D2981041867CD0E7B5C05341003B700EB67F10419CC42068CCC0534170006F0186661041B8847C28DEC0534140211FF4D94C1041B08BDB68F1C05341C0AF03E7A9331041C84B37A903C15341503EE8D9451A104150AF942917C15341D0CCCCCCFD001041DA12F2A928C15341C0B6627F1BD00F4160764F6A34C15341A0416065CB9D0F41EAD9AC2A4DC15341A05E294BA36B0F41703D0AAB54C15341E0CEF753C36C0F41E258176BE7C2534180D1915C836D0F41E6D0226B7AC45341806DC57E136F0F41E2361AAC0AC65341A00B24A89B6F0F41ACFA5C6DA3C75341E03B4ED1DB700F41548D97EE35C95341A0900FFAE3710F41887CD06FC6CA5341400AD7235C740F414EC807B158CC5341E0A8A44EEC770F41A4703D32EECD5341E06B09794C7B0F4120D26FF380CF5341000A68A2847D0F419C33A2B410D1534140F163CC84810F41161DC9F59BD2534140B4C8F664840F41927EFB7631D45341E09BC420ED860F410EE02DF8C5D55341C039234A0D890F411C9E5E7957D7534100D88173ED8A0F412A5C8F3AE9D8534160BF7D9D458D0F41381AC07B7EDA534120CB10C72D8F0F4144D8F07C13DC5341405F984C26910F416EA301807EDD5341C0931884E8820F41F68E53DC82DD5341A0B20C719E620F414E840D578DDD53410023DBF93D640F41F41648C01DDF5341E009682236660F416C787A81B3E0534120F0164806680F41528D97823CE2534120FBCB6ED6690F41F02FBB83CEE35341A02A1895766B0F41F675E00460E55341A0EC2FBB0E6D0F41287502C6EFE65341206519E22E6F0F41E8D022C782E8534100DE020937710F4116D0444818EA5341607B832FEF720F4144CF6689ABEB534180863856D7740F41062B878A3FED534120FF217D17770F41E63FA40BD3EE5341400AD7A3EF780F41A89BC40C69F05341', 'Becker');
INSERT INTO "public"."minnesota" ("geom" , "name") VALUES ('010600002023690000010000000103000000010000006102000050454732D0F6134184E2C7F8EA8454412058393450F813418C4AEA00EA845441B00E9CF3A30F14410222FD72DA84544150863896841114419E5E29B3D9845441002B87D6B828144118AE47A9D184544190D93DF9C32A144190317749D0845441F0065F58FC4114419465889BC0845441109A089BF4431441A445B64FBF845441B0506B1A455B1441F463CC81B084544130363CFD485D14416EE7FBE5AF845441905CFE0304741441E2E9952EA784544150CA32C4D87514419A779C82A68454419038D6C57C8D1441D678E9BA9D845441D05296E1308D1441905374B802835441102DB21D2D8D14411A485038EB825441902D219FE88C1441063411767381544180AC8B9BE48C14416C6FF0A55D815441B033A2F4178C14412C431C73DD7F5441901804966B8B14411093A92E467E5441701058F9CA8A144162764FEAB77C544170984CD5C38A144108AC1C46A67C5441203FC65CE2891441DC12F21D2A7B544120D04498C5891441A401BCA9167B5441E0240681128914415427A0E19F79544190D93DF902891441CAC342A57E795441400378CB668814419A99995D30785441208A1FE35488144158A835DD0C785441104850FC498814416419E25CEF77544100780BE4B2871441806ABCDC74765441D088D2DEAA871441B6847C185E76544120022BC71C871441F8065F58E674544100371A001287144196D40914C874544180F08549798614416A2BF69754735441B04082A274861441789CA2CF36735441305530AA3886144100917ECBBB715441404CA64AE48A14415A5BB1DBB97154411071AC8B759414410AF016E8B57154410096B24C989F144108E78C80B0715441B03A01CD94A21441A4ABAD60AF715441900D4F2FC8B814410A3D9BFDA57154418004C5CF2CBC1441F0EBC0CDA4715441C0293A92B4D114410E93A9D69C715441E0E995B230D51441F241CFB29B71544130211F34D0E1144188855A8B97715441F07C3FF5D8EA14415AD3BCAB947154419058A8B550EE1441AC25E48F93715441606B9AB720041541F085C9548971544150A2B4F74505154162A1D6C888715441802BF6D7580715416691ED4888715441D010C77A3C1D15411E0DE0398271544150EC2FBB882015419818043681715441202DB29D1C3615419006F0327A715441B0081BDEC0391541E258170379715441E076BEDF3B4F15414A72F92F6E715441E0361A00E95215419EC420E46C71544190B7408234681541DE24069D64715441A0AEB6E2206C15417C6132956371544180832FCCC4811541CAC342F15D715441A0CDAACF60851541E02406155D71544110819503D19A15417424975754715441B0AF03E7889E1541AC3E57D35271544150355EFADCB31541D49AE65148715441102DB21D61B71541589FAB1947715441A0A0F8F1E4CC1541CAE53F983F715441F0CEF71315CF1541E4361ADC3E71544110DE028920E615414E158C7E337154412083C04A05E8154122F46CEA32715441701283002DFF15414460E5F02A71544180B7404205011641163FC6702A71544130992A183918164138AB3E5F237154412075025A211A16410A8A1FF32271544110E02D504D3116410A3D9B451D71544190D71272413316416C787ABD1C7154415082E247694A164192E4F2D315715441F00B93693D4C164162C3D30315715441D088D29E55631641A8E848A60A71544160499DC0396516410E2428160A715441F061A196A17C164154499D0C03715441D03D79D8917E164128287E7C0271544140D6C5ED8D9516414894F682F9705441B09690CF79971641ACCFD59EF8705441803480F708AF16414082E26FEE705441206C78FAA1B01641A2CDAAEFED705441D0DCB58495C71641748A8E0CE5705441D054C128AEC9164182734614E5705441304FAF14F2E01641E88C2891E2705441B02E6E63CAE81641E4361A5CE170544150772D2198F8164170E7FBE9DE70544150014D8442FA16415C8FC29DDE70544180F2B090DE00174188D2DE74DD705441601E16AA780E1741029A08CBD9705441F0E995B20E131741B0506B8ED8705441E07F48BFF6191741DC1B7C99D5705441B089B061832C174124DBF97ACF705441609FABED0E331741BEC117B2CC70544130A089308345174132B29D77CA705441B01A2F1D334C1741F051B8AAC970544190F6065F9F5E17417EFB3AF8C170544170CC5D4B5765174160545223BF705441C0F1D28DF3771741AA13D080B8705441A0900F7A8F7E1741D856EC23B6705441906CE7FBE3901741B6EA73A5AF705441E09C11A5DB95174182E2C7A8AD7054413071AC0B74AA174194180452A9705441A03C2CD4F3AE17411E166A5DA8705441C0ADD81F64C31741A267B3969F7054418081048552C51741D88173C29E70544170D5E72A70C71741580E2D629E705441B0416025B4DC17416CBC74EF99705441D04D6250B4E01741FCA9F11E99705441D030996AE4F5174180FB3A849470544180613295C0F917415AD3BCAB9370544160840D8FF80E184102DE02AD8C705441306C78FA201318414AE17AC88B70544100BC05928C1218415674244FDD6E5441D0BAB84D681218416207CE4D406D5441304CA60A281218417012830CAD6B544140CB10C7E3111841127A364B176A5441904AEA84A3111841FECBEE498A685441E0240641531118413090A048F366544190ED7CFF3E111841D2F753876665544130FF21BD2211184196180446D56354416029CB90AA10184188EB51443A625441E08AFD651A1018410E93A942AA605441D0FEB23BDA0F184192C2F5C0165F544100BC0512B20F1841829543BF865D5441408B6CE7010F18412E6EA3BDFC5B5441B023B9BC990E18418CE4F23B6A5A54412085EB91490E184138CD3BFAD4585441609D80667D0D184198BB96F846575441D0EC9E3C3D0D1841FA31E6B6B85554412085EB11F50C184134772D7524545441506744E9A80C184170AC8BF3A35254418048BFBDE80B18411E0DE0711351544140BB278FE8091841F21648B0824F5441E0D32B6590091841E6E995AEF64D544120917E3BC0091841865AD3AC624C544190A98211CC0918419A6E12EBCE4A5441F01B7C21DC1018410C93A90ECF4A5441F05817F737101841280F0B694A49544150E17AD4E30F18412A530527B7475441505986B8D30F1841A69BC4A42346544170AC8B9B6F0F1841B84082A28C445441607FD97DB30E1841A62C43A0F6425441B09BC460270E1841705F079E63415441905CFE43C90D1841F0A7C6CFCF3F544120A5BD81B40D1841C00E9C7BB13F544140D49AE6140D1841BEDA8A813C3E544190537424000D1841668863FD203E54419026C2062F0C184130BB27578E3C544110D578E9460B18417009F954043B5441B04C15CC8E0A1841383CBD9272395441E08D06B0260A184128A08990EA375441D01726939609184162764FCE5C36544130C6DC750A0918419AD4090CC83454416019E25886081841141DC98937335441205A643BDA07184128C28607A5315441903F351E6607184112363CC50E3054412080B700B6061841B837F8C27C2E544160D3BCE32D0618413CDF4F41EA2C54414082E2C7D1051841E61DA7405C2B5441E0E76AAB71051841B615FBBFC529544110E02D9065051841186A4DBF35285441D0C56D742D051841E861A13EA426544160621058D104184148B6F33D0F2554412051DA5B610618418E28ED7D0F2554410000004005061841CAC3427D8123544120F8C224E50518419ABB963CF3215441A0825109B505184168B3EAFB632054411044FAED7405184116F2417BDA1E544190855AD36C051841528D973A521D5441105B42BEA8071841B4E1E939C51B5441701B0DA05C061841F07C3F39371A5441C013D084500618414ED191B8A518544130E6AE65F8041841663BDF770E175441305EBA49C004184158EC2FF77815544140E8D92CE0031841BA408236F11354419004C50F28031841CEAACFF55F12544190F4DBD75B021841CE195136DD10544170764F9EAB0118418A16D9F64C0F544170D3BC63D7001841D26F5F37B80D5441704F1E96490018412041F15F660C5441C01E852B330018414282E2F7300C544160EA04F43200184120386738A30A5441000EBEB06AFF1741FEDD02B9CF085441E032C4715EE617412E871639D408544190C5FE3232CD1741E88C28B9DC085441D0FC87F41DB4174114363CB9E5085441A00F7AB6519B17413CDF4F39F008544130772D61B17F17418A4160B9E808544110AAF11249661741DAA370F9E30854410098DDD35051174192317739EB08544110B9FC872038174196A98279F3085441D0581737481E1741083D9B39E5085441301FF4EC7F0517410CB5A6F9F0085441604013A16BEC1641EC73B539F7085441E061A156A3D316415E8FC239010954411027310823BA1641667FD9B9FE085441204850BC5AA11641FCCBEE39FE085441000EBE70FA87164170E7FB390E0954413031082C3A6E16410AAC1C3A2C095441008F53F401551641BE3099BA2B095441B047E1BAD93A1641C09F1ABB2C095441B001BC85FD21164150F38EFB39095441F0164850CD08164172A301FC49095441B0506B1AC1EF1541DC3D797C5509544140F8C2E4A0D615416A91EDFC63095441D06800AF70BD1541688863BD73095441F0B5847C94A4154138D6C5FD9B095441005D6D45708B1541CCA1453E9F09544190DFBE0E4C721541EEC9C3BEA5095441F0065FD823591541A44E407FB00954415094F6C6FF3F1541A223B900BA095441B0BB96D0C326154142A4DF02CC095441C0506BDA630D1541BA6B0985DE09544100780BE4BFF41441E8D02287F2095441806891ED77DB1441CE3B4EC9020A54410022FDF65FC214416ABC744B120A5441A0ED7CFF5BA91441C0CAA14D180A5441C04B3709389014415E4BC84F2B0A54411085EB1170771441FECBEE11340A5441507DAE364478144196B20CD1BC0B544100BF0E5C04791441C2F528104D0D544100DCD7819C791441F238450FE00E5441C09DEFA71C7A1441207C614E761054410096B2CCB07A144194A9828DFF115441407C61F23C7B14412E90A04C92135441E09AE61D797B144120166A0D2515544100CCEE49ED7B1441F4D24D4EB916544190218E755D7C144158EC2F4F4A185441605227A0097D14414AEA0450D2195441C015FBCB617D1441B003E710651B5441407E8CF9D17D14416007CED1081D54410066F724467E14410E93A9129A1E54416029CB50067F1441703480132E205441D0EC9E7CAA7F1441B01C5A14C3215441900B24A862801441A01A2FD5542354412061C3D34E811441BAD10056E824544170522760DF811441F8B9DABA8226544130DBF9FE6F7B14419A6E12BB84265441903F351E0F7714417E1D38DF862654413067442967771441020000581A285441C0051254137814413AF8C2D8AB295441B0B6627FFB78144170F08559402B544190B0E1A9CF791441CAA145DACD2C5441200681D5A37A1441723D0A9B662E544150302AE94B7B144126B9FC5BFC2F544180B3EAF3437C144100DE02DD91315441A0FF90FEF77C144102BC055E2333544170029A08C47D1441B437F8DE9D345441A0B96B09F87D1441703D0A1FBC345441D0051214B47E144104780B604E365441F051B81E7C7F144196B20CE1E1375441409E5E2958801441BA490C627439544140211F341C8114414E840D63083B544150257542B5811441EEB7AF9B243C544110D04498B2791441F41FD257383C5441D08F31770E7714411A51DA0B433C5441F06A2BB62E741441AE25E413513C544180613215C5711441FC0FE997563C544160F38E13036E1441B49DEFA75E3C544190BC7453D16D14412041F1A7603C544170E09CD10169144102000028723C5441B00A462597681441C6D32B49743C5441D0847C500F66144198D40938813C544120E9B7AF8B6314419A4C15D0903C544140C4B1AEAC6014419EC42018A03C544130C4B12E595F1441684469D7A73C5441B015FB8BA8581441AA2C43ECCE3C5441F0F0F44AB75514411848504CE33C544170E7FB290A5214411E3867D4023D5441A08EE4F25F501441E4141DA90F3D5441A0C2F5E8B54E1441DC3D797C1C3D54414070CEC8504E1441D83D79EC1D3D5441E054C1A8F74D1441B8847C88223D5441002731C8014C14414A5986C0303D544130C28627EF4914414ED19134423D5441806FF08541451441787AA51C5D3D5441E09387C53B431441C6DCB5E8743D5441A0416065F541144138F8C28C883D54411066F764EC3F144118B7D15CA03D54418026C206233E1441F8EDEBA8BA3D5441B0825109E03B14414E4013ADE53D544160C3D3AB9139144134EF38CD0E3E5441A0E848AE5F3714413E575BCD323E5441F0285CCF2B3714415EBA493C373E544110F2418F923614411E166A55443E5441A0635DDCCA351441341136785B3E5441C0847CD0BE35144148BF7DDD5C3E544100FCA9B1D434144106C58FA5713E5441D0C56DB4DD3214413A5EBAADA63E5441300681151A321441181DC9E9B63E5441E05817B7EC3014411E0DE071D33E544180C7297AB82E1441BC490C96083F5441B0506BDA7E2E1441043411120F3F5441A07EFB7A272E14412E65191E183F544160B515FB142E14419C081BF61B3F54419075711BE52D1441E2F21FC2213F5441B035CD3BC12D1441A08026FE2B3F5441906CE77BAD2D1441102428522D3F5441E0BE0E5CAF2D1441E66A2B1E313F544150DA1BBC912D1441E86A2B6E323F5441905AD33C5C2D1441EEE2366E423F5441D0DA8A7DF32C1441F05A423A513F544150AD691E582C1441F0D24D22603F5441F0482EBFE62B144166EE5A22723F5441D07F48BFDD2B1441D2915CAE743F5441D076BE9FAE2B14418C1F63667C3F544110B7D100222B14414625756E953F5441B05B20C1072B1441900F7ABE9D3F5441C02E6E23032A14410A1B9ECACF3F5441F0AE25A4CF2914417C36AB92E33F5441106F8104AA291441587DAE02EA3F5441C013D08485291441120BB5F2F23F5441509FAB2D7F29144122D26F5FF33F54410066F7E4672914417EAEB6EEF43F544140B81E055F291441EA51B87AF73F5441C0D32B65552914415AF5B9C6F83F544180787AE539291441363CBD8EFE3F5441F08AFDE5E22814415E6DC5360840544170A60A46EE281441CC10C7C20A4054415070CE485C271441B4BFEC563E40544110CCEE89CF2614416EC5FEBA5640544160E7FBA9D0261441DE68004759405441305530EAA82614414C0C023F5B40544110C3646AAB261441265305576040544140431C2B6226144128CB10FB70405441F0A7C64B382614412E431C1B84405441C015FBCB302614417A2D21DB8940544180832F4C13261441E6D022D38B405441105F980CFB2514410E022B939840544190711B4DCD251441C88F3173A340544120166A4DC8251441801D38A3AD405441C0B12E2E89251441849543E3BE405441E0A8A44E7A2514413C234A5FCA405441A0BB9690B9241441FCA0674BF5405441F044D87089241441448B6C17FB40544180E09CD140241441460378030D415441D0293A121F241441DAD781AF1B415441C020B0B2F12314419865889326415441E0E00B53EC23144150F38EBF30415441003D9BD574231441EC2FBB9775415441A023B97C72231441FC3A70F285415441F06A2B76722314418404C51F86415441707DAE76442314413C92CB5B90415441D08F317742231441D066D5DFA0415441B0BDC11720231441F897DD47AE41544170226C380B2314416CB3EA03C24154417019E298E72214412041F1E3CC415441D02B6559D92214414872F99FD9415441F0D9AC7A8D221441741B0D2CFA41544120917E7B45221441E6361A580D425441C035CDFB3E22144130211FFC14425441E0B5847C09221441C4F528FC24425441903F359EEF211441F216487858425441D088D25EC32114418AEB518C66425441408941A0B921144168226CC09142544170F7E4E1E62114412CA089C8C5425441402575C20F2214412A189548DB42544170EE5A823722144160E5D0CE19435441303867843822144112C7BA641B43544170666626ED221441B003E7146B435441C0B88D861A231441FAEDEB2875435441D078E96635231441261FF4188343544130A7E8C8892314417A711BD1C843544110A7E888A023144154B81EDDCD435441D030992AFB2314415E2041510B4454414003780B132414411826537928445441907AA52CDC241441464772316344544160B1BF2C1E251441903177DD6D445441104D84CD95251441BADA8A2193445441806891ADB5251441267E8C3D9644544120E25897E72514418838D68DA944544140C4B1EE3E261441ECFBA959CB44544150BB274F86261441EC73B5D5E044544110E9B7AF3A271441161DC9F505455441603BDFCF47271441F263CC4D0C4554416072F9CF6A2714413E4ED1BD15455441B0BB96D07B27144142C6DCC92845544100F31F92AC2714416CE7FB515F45544180CE8812DF271441705F078E7345544110AAF15205281441043411FE8345544180C5FEB272281441C0C117AE93455441A057CAB2FB28144108AC1C3E9E4554414073D71227291441E6F21FDEA3455441403CBD9250291441E6F21FB6A5455441403CBD129D29144134DD245AB045544100E10B93A02914417EC729F6B745544150B3EA33C429144138CD3BAAD7455441D00512D41C2A14415EFE435EE74554410098DD53542B1441AA60545E0A46544130211F74982B1441D4915CDE18465441005839B4DA2B14411C7C612E2446544130211F74302C1441666666EA2C465441F0CEF793792C1441686666323146544160B3EA33B92C144142AD69D2364654414008ACDCCA2C14410E2428C238465441807CD0F3192D14418E976E6E41465441108F53F4992D14414E9D80826346544120462575792F1441587DAE2ABC46544160984C15A13014415C6DC516E846544120068195B9301441A857CAF2F046544180984C15023114411AFBCBFAF346544160984C157A311441402CD4EA04475441300681554C321441FC31E6BA284754410074B595B7331441BAAF037F62475441C0AACF95E4331441049A08F36B475441006B2B36993414412E431C139147544160863896FC341441C417260FA2475441005F980C10361441D244D82CCA475441608638964A371441605452FBF747544160CF6615B23A14414A7B83FF5B485441E073B5155C3B14419A779CFA7F485441808FC235943B14412EB29DDB8B485441904F1ED6D23B14419ECDAA83A448544140BD52D60B3C1441C8FEB21FB1485441102B8756263C14417E8CB963BE485441607DAEB68C3C1441F2A7C617D5485441D098BB16263D1441F41FD2ABEB485441D0A14576443F1441DCCEF70F3349544130FDF6B5A23F14414672F94339495441E0AACF1544401441DC4603044C49544140C6DCB5A4401441D400DE565A49544190218EB53B4214412E992AAC964954419058A8F5CC4214411258395CB249544190218EB52E4314413A894180BF495441C0B359B58343144112D044F8C6495441C02A18D5CC43144184734648CB495441E0BCE3D47944144188EB5190E0495441806ABC74074514411CC05B9CF4495441F085C91422451441F6065FECFA495441B0EA73353645144144696FAC164A5441C0F3FDD49045144144696F80164A5441F085C994BD451441D6C56D6C164A5441F07C3F358B461441D8C56D0C164A544160FE433AA14614417A7AA5EC2F4A5441F06C56FDDA461441163FC6183F4A544110F775203D4714414260E5244E4A5441F0C03923BD47144102DE02455B4A54417038D6C5644814410ACE1969664A5441805DDCC68F4814410A4625656B4A54412068222CE34814411E9E5EF1854A5441D09F1AAF77491441DA1B7CA9934A544100174810C149144172F0859D984A544140189514774A1441102DB29DAC4A5441A006F0160A4B1441161DC929B74A5441E0073D9BA14B1441B659F5D9CB4A5441F05A42FE2B4C144176D71296D94A544190EB51784A4C1441C486A7B7DB4A544110EEEB40D44C1441560E2D5AE54A5441A0C95401D74C1441A4F83192E74A5441208A1F63E34C1441CAA145C2F04A5441F0AE2564254D144162764F5EF54A5441A04AEAC4564D14418AA757CEF84A5441E0B88D86824D1441D60968A6004B5441F06F5F47994D1441FC3A70C2044B544120F9A027B34D1441DA8173BA054B5441E0141D49494E14414A9D80720B4B5441200DE0AD834F1441567DAE7A204B544130BB270FC04F1441C898BB92264B5441A0B20CB118501441F241CF762F4B54416005A3D24450144142A4DF02374B5441105839748F5014418E06F07E3E4B544140E17A949F501441FCA9F12E3F4B54411034117635511441DA6800C3454B5441F061A1166F51144126530543484B544150A2B4F7D0511441C0270F8B4C4B5441B09999191C521441E6D0224B554B5441F0D9AC3A35521441E8482E7B5A4B5441A07EFBBA3D521441C68F31375C4B54417091ED7CB1521441F23845E7644B5441A011A5BDF7521441A8C64BDF674B5441A0E4F29FD35314414413611F714B5441A0CDAACFFC5414419ABB96BC834B54412066F7A42C551441BE9690BB864B54416094F606A155144154E3A50F904B544170029AC8B855144110E9B747984B544160302A29CE551441C876BE0B9B4B54412095D409E45514411861C3E79D4B544190DE710A2C561441CEEEC98BA04B544150D5E7EA4B56144116D9CE6BA24B544140F1634CAA561441FA97DDFFA84B5441005F98CCC9561441683BDFC7A94B5441906891ED4E5714418C6CE727AD4B544130BB27CFC15714416A2BF6EBB34B5441F00434511758144104780B50BD4B544140333373A95814412E211FF0C54B5441B0506B1A235B144144F163F8E34B544140C8077D8E5B144124287E7CF04B5441A05CFE43985D144138F8C2080E4C544120265385BE5D1441AA13D090144C5441B0A67987FB5D1441B003E7041F4C5441D039238A995E144102DE02712B4C54413031086C215F14412C871675334C5441A0D6346F915F1441A2F8319E394C5441C09DEFA73D5514410ACE19F53D4C5441D0490C02314A144106560E51424C5441A09BC4E0CE47144198B20CA5434C544150F163CC083C144176711BFD494C544140871619E430144156302AFD4F4C544190C2F568DD22144112363C45574C5441B057CA32F4191441386744D15A4C5441F07C3F35C517144116AE47F55B4C5441F0FDD4B89514144164984C9D5D4C544180810485E10914413E575BBD634C5441D069DEB198FE13411E166A356A4C544110098A9FB9F213416C787A95714C5441D0A8A4CE5CE513412A7E8C11794C5441A006F01612DE1341C25296817D4C5441F0BE0E5CA5D9134178E09C31804C5441E0270FCB3DCC1341C642AD0D874C5441B0B4377895C01341A401BC058D4C544140871619CFBF1341A601BC798D4C5441604BC8C70DB31341D0AACF31964C5441107D3F7551A713411C0DE0359E4C5441C01C5A24049A1341D812F255A64C5441F0FBA9314E8E1341B6D1007AAD4C5441701283C0E18013412AED0DF2B24C5441C0BAB84D1A7513410CAC1CEAB84C54413008AC9CB5671341EA6A2BB6BF4C5441404CA64A565B1341CA293AE2C64C54417019E298A14E1341A8E848C2CD4C5441705DDC8652421341F44A5916D54C5441200681953D351341D6096826DC4C5441208A1F2326291341B6C8767EE34C544110B8AF83A6281341226C78C2E34C5441F0E53FA44A1C1341BC270F83EB4C5441B03E571B0A101341B88D0634F34C5441703480F7D30A134144696F40F64C5441600E2DB281031341943A018DFA4C544180F90FE911F712416CE7FBD5014D5441E066D52768F5124108AC1CBA024D5441F076BE9FA1EA12416E4DF3A6074D5441900F7AF63DDE12416AB3EA530D4D5441A03A01CDA1D112414460E544124D544100D34D2266C31241BAD10096184D54413075029A65B81241F8B9DA0A1D4D54414072F90F16B91241E81DA77CAC4E544110022B47CEB91241920F7A7E445054418048BF7DA6BA124114D04440D7515441205839B45ABB124176D712426A535441405530EAE6BB1241683BDFC3FA54544140772D2197BC1241A289B08592565441F04F8D5747BD1241244A7B0725585441004D848D8FBD124160984C09B8595441104A7BC31FBE1241E258174B495B544160FE43FAF3BE1241F875E08CDE5C5441401CEB224ABF1241A679C7CDA65D5441B0C42030A0BF1241C2A8A4CE6E5E5441802F4C66B8C01241D44D6250FF5F5441F0ACFA9C78C11241EA6A2B5295615441403CBDD248C21241FC0FE9132463544100DE0209EDC212410E2DB295B864544170378941C5C31241C876BE1749665441004B598609C51241363333DBDA675441F0F0F4CA45C61241C2A8A45E6B695441F016481032C712410E2428A2016B54414018955436C812410A3D9B25916C544120BE30990AC912412C8716E9236E544170764FDEEEC91241065F98ECB96F5441A0779C22B7CA1241506210B04B715441C06B09F95ACB12413C2CD4F28B72544180D93DB95BCB12411873D7528D725441B003E74CC3C112412C431C339072544110F2418F15C21241DCF97E761E745441E0CEF7531BC21241363CBDB63A745441F03B4E114DC212411C0DE079AC7554411046253550C2124174D712B6C3755441C0EA73F51CC312413EDF4FB942775441F034EF3828C31241DE1B7C3D57775441C0627FD953C41241EA95B270D4785441D0E3149D61C41241FA75E080E978544170C807BD77C51241BE05126C637A544110EEEB0089C5124114D044DC7A7A5441D05296E1CAC61241244A7B4BF77B5441E0CAA1C5DDC612417A14AE0F0F7C5441E09C1165AAC7124140A4DF06897D5441D054C1A8B5C71241BC270F179F7D5441E00B932917C91241CCA145D21A7F544150E8D9AC28C912418E976E522E7F5441905F070E56CA124132E6AE95AE805441F0FBA97166CA124140C6DCC9C3805441F0C9C3024BCB1241F0F44A993E8254417081044557CB124100D578D951825441C0293A12C6CB1241C4D32B19E283544140234A3B26CB12417CF2B0DC62855441D0E76A6B6EE212418051499D4E85544140696F70C6E4124140575BCD4D8554417009F9A09EFB1241BA490CCA45855441C0B88D8642FE12415496219A44855441102B87D6F2141341849ECD5E3A85544180B515BB16171341D600DE7A39855441009F3CEC4A2E134150F38E9F2F85544180204131A33013410AF9A0D72E8554411048503CEF461341104FAF60278554418024973F33491341B003E76027855441C0529661BF6013410A8A1F73268554412041F1635B62134162DC464326855441F0A59B444F791341B272680D228554419014AE478B7B134178E09C1921855441B0E61DE752921341A0CDAADF158554412095D4C94B941341ACADD87315855441A067B36A93AB1341DC8AFD2D0F855441B0FA5CAD7BAD13417AC729560E85544150DF4FCD9FC413413A89410404855441E056ECEF7FC61341D6C56D54038554416060E5500CDE134178469462FB845441403CBD1268DF1341120BB5EEFA84544150454732D0F6134184E2C7F8EA845441', 'Beltrami');
COMMIT;
