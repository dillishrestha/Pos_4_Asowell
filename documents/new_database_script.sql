﻿create database DBAsowell
go

use DBAsowell
go

CREATE TABLE [dbo].[AdminRes] (
    [ad_id] [varchar](10) NOT NULL,
    [username] [varchar](50) NOT NULL,
    [pass] [varchar](50) NOT NULL,
    [name] [varchar](50) NOT NULL,
    CONSTRAINT [PK_dbo.AdminRes] PRIMARY KEY ([ad_id])
)
CREATE TABLE [dbo].[Employee] (
    [emp_id] [varchar](10) NOT NULL,
    [emp_code] [int],
    [manager] [varchar](10) NOT NULL,
    [username] [varchar](50) NOT NULL,
    [pass] [varchar](50) NOT NULL,
    [name] [nvarchar](50) NOT NULL,
    [birth] [date] NOT NULL,
    [startday] [date] NOT NULL,
    [hour_wage] [int] NOT NULL,
    [addr] [nvarchar](200),
    [email] [varchar](100),
    [phone] [varchar](20),
    [emp_role] [int] NOT NULL,
    [deleted] [int] NOT NULL,
    CONSTRAINT [PK_dbo.Employee] PRIMARY KEY ([emp_id])
)
CREATE INDEX [IX_manager] ON [dbo].[Employee]([manager])
CREATE TABLE [dbo].[OrderNote] (
    [ordernote_id] [varchar](10) NOT NULL,
    [pay_method] [int] NOT NULL,
    [totalPrice_nonTax] [money] NOT NULL,
    [subEmp_id] [varchar](200),
    [discount] [int] NOT NULL,
    [cus_id] [varchar](10),
    [emp_id] [varchar](10),
    [ordertable] [int] NOT NULL,
    [ordertime] [datetime] NOT NULL,
    [total_price] [money] NOT NULL,
    [customer_pay] [money] NOT NULL,
    [pay_back] [money] NOT NULL,
    CONSTRAINT [PK_dbo.OrderNote] PRIMARY KEY ([ordernote_id])
)
CREATE INDEX [IX_cus_id] ON [dbo].[OrderNote]([cus_id])
CREATE INDEX [IX_emp_id] ON [dbo].[OrderNote]([emp_id])
CREATE TABLE [dbo].[Customer] (
    [cus_id] [varchar](10) NOT NULL,
    [name] [nvarchar](50) NOT NULL,
    [phone] [varchar](20),
    [email] [varchar](100),
    [discount] [int] NOT NULL,
    [deleted] [int] NOT NULL,
    CONSTRAINT [PK_dbo.Customer] PRIMARY KEY ([cus_id])
)
CREATE TABLE [dbo].[OrderTemp] (
    [ordertemp_id] [int] NOT NULL IDENTITY,
    [totalPrice_nonTax] [money] NOT NULL,
    [subEmp_id] [varchar](200),
    [discount] [int] NOT NULL,
    [cus_id] [varchar](10),
    [emp_id] [varchar](10),
    [table_owned] [int],
    [ordertime] [datetime] NOT NULL,
    [total_price] [money] NOT NULL,
    [customer_pay] [money] NOT NULL,
    [pay_back] [money] NOT NULL,
    CONSTRAINT [PK_dbo.OrderTemp] PRIMARY KEY ([ordertemp_id])
)
CREATE INDEX [IX_cus_id] ON [dbo].[OrderTemp]([cus_id])
CREATE INDEX [IX_emp_id] ON [dbo].[OrderTemp]([emp_id])
CREATE INDEX [IX_table_owned] ON [dbo].[OrderTemp]([table_owned])
CREATE TABLE [dbo].[OrderDetailsTemp] (
    [ordertemp_id] [int] NOT NULL,
    [product_id] [varchar](10) NOT NULL,
    [chair_id] [int] NOT NULL,
    [SelectedStats] [nvarchar](50) NOT NULL,
    [note] [varchar](500) NOT NULL,
    [discount] [int] NOT NULL,
    [quan] [int] NOT NULL,
    CONSTRAINT [PK_dbo.OrderDetailsTemp] PRIMARY KEY ([ordertemp_id], [product_id], [chair_id], [SelectedStats], [note])
)
CREATE INDEX [IX_ordertemp_id] ON [dbo].[OrderDetailsTemp]([ordertemp_id])
CREATE INDEX [IX_product_id] ON [dbo].[OrderDetailsTemp]([product_id])
CREATE INDEX [IX_chair_id] ON [dbo].[OrderDetailsTemp]([chair_id])
CREATE TABLE [dbo].[Chair] (
    [chair_id] [int] NOT NULL IDENTITY,
    [chair_number] [int] NOT NULL,
    [table_owned] [int],
    CONSTRAINT [PK_dbo.Chair] PRIMARY KEY ([chair_id])
)
CREATE INDEX [IX_table_owned] ON [dbo].[Chair]([table_owned])
CREATE TABLE [dbo].[Table] (
    [table_id] [int] NOT NULL IDENTITY,
    [is_Printed] [int] NOT NULL,
    [table_number] [int] NOT NULL,
    [chair_amount] [int] NOT NULL,
    [pos_X] [int] NOT NULL,
    [pos_Y] [int] NOT NULL,
    [is_Pinned] [int] NOT NULL,
    [is_Ordered] [int] NOT NULL,
    [is_Locked] [int] NOT NULL,
    CONSTRAINT [PK_dbo.Table] PRIMARY KEY ([table_id])
)
CREATE TABLE [dbo].[Product] (
    [product_id] [varchar](10) NOT NULL,
    [name] [nvarchar](50) NOT NULL,
    [info] [nvarchar](100),
    [price] [money] NOT NULL,
    [type] [int] NOT NULL,
    [deleted] [int] NOT NULL,
    [ImageLink] [nvarchar](max),
    [Discount] [int] NOT NULL,
    [std_stats] [nvarchar](50) NOT NULL,
    CONSTRAINT [PK_dbo.Product] PRIMARY KEY ([product_id])
)
CREATE TABLE [dbo].[OrderNoteDetails] (
    [ordernote_id] [varchar](10) NOT NULL,
    [product_id] [varchar](10) NOT NULL,
    [discount] [int] NOT NULL,
    [quan] [int] NOT NULL,
    CONSTRAINT [PK_dbo.OrderNoteDetails] PRIMARY KEY ([ordernote_id], [product_id])
)
CREATE INDEX [IX_ordernote_id] ON [dbo].[OrderNoteDetails]([ordernote_id])
CREATE INDEX [IX_product_id] ON [dbo].[OrderNoteDetails]([product_id])
CREATE TABLE [dbo].[ProductDetails] (
    [pdetail_id] [varchar](10) NOT NULL,
    [product_id] [varchar](10) NOT NULL,
    [igd_id] [varchar](10) NOT NULL,
    [quan] [float] NOT NULL,
    [unit_use] [nvarchar](100) NOT NULL,
    CONSTRAINT [PK_dbo.ProductDetails] PRIMARY KEY ([pdetail_id])
)
CREATE INDEX [IX_product_id] ON [dbo].[ProductDetails]([product_id])
CREATE INDEX [IX_igd_id] ON [dbo].[ProductDetails]([igd_id])
CREATE TABLE [dbo].[Ingredient] (
    [igd_id] [varchar](10) NOT NULL,
    [warehouse_id] [varchar](10) NOT NULL,
    [name] [nvarchar](100) NOT NULL,
    [info] [nvarchar](300),
    [usefor] [tinyint] NOT NULL,
    [igd_type] [nvarchar](100) NOT NULL,
    [unit_buy] [nvarchar](100) NOT NULL,
    [standard_price] [money] NOT NULL,
    [deleted] [int] NOT NULL,
    CONSTRAINT [PK_dbo.Ingredient] PRIMARY KEY ([igd_id])
)
CREATE INDEX [IX_warehouse_id] ON [dbo].[Ingredient]([warehouse_id])
CREATE TABLE [dbo].[ReceiptNoteDetails] (
    [rn_id] [varchar](10) NOT NULL,
    [igd_id] [varchar](10) NOT NULL,
    [quan] [int] NOT NULL,
    [item_price] [money] NOT NULL,
    [note] [varchar](500),
    CONSTRAINT [PK_dbo.ReceiptNoteDetails] PRIMARY KEY ([rn_id], [igd_id])
)
CREATE INDEX [IX_rn_id] ON [dbo].[ReceiptNoteDetails]([rn_id])
CREATE INDEX [IX_igd_id] ON [dbo].[ReceiptNoteDetails]([igd_id])
CREATE TABLE [dbo].[ReceiptNote] (
    [rn_id] [varchar](10) NOT NULL,
    [emp_id] [varchar](10),
    [inday] [date] NOT NULL,
    [total_amount] [money] NOT NULL,
    CONSTRAINT [PK_dbo.ReceiptNote] PRIMARY KEY ([rn_id])
)
CREATE INDEX [IX_emp_id] ON [dbo].[ReceiptNote]([emp_id])
CREATE TABLE [dbo].[WareHouse] (
    [warehouse_id] [varchar](10) NOT NULL,
    [contain] [float],
    [std_contain] [float] NOT NULL,
    CONSTRAINT [PK_dbo.WareHouse] PRIMARY KEY ([warehouse_id])
)
CREATE TABLE [dbo].[SalaryNote] (
    [sn_id] [varchar](10) NOT NULL,
    [emp_id] [varchar](10) NOT NULL,
    [date_pay] [datetime],
    [salary_value] [money] NOT NULL,
    [work_hour] [float] NOT NULL,
    [for_month] [int] NOT NULL,
    [for_year] [int] NOT NULL,
    [is_paid] [tinyint] NOT NULL,
    CONSTRAINT [PK_dbo.SalaryNote] PRIMARY KEY ([sn_id])
)
CREATE INDEX [IX_emp_id] ON [dbo].[SalaryNote]([emp_id])
CREATE TABLE [dbo].[WorkingHistory] (
    [wh_id] [varchar](10) NOT NULL,
    [result_salary] [varchar](10),
    [emp_id] [varchar](10),
    [startTime] [datetime] NOT NULL,
    [endTime] [datetime] NOT NULL,
    CONSTRAINT [PK_dbo.WorkingHistory] PRIMARY KEY ([wh_id])
)
CREATE INDEX [IX_result_salary] ON [dbo].[WorkingHistory]([result_salary])
CREATE INDEX [IX_emp_id] ON [dbo].[WorkingHistory]([emp_id])
CREATE TABLE [dbo].[ApplicationLog] (
    [id] [int] NOT NULL IDENTITY,
    [date_added] [datetime] NOT NULL,
    [comment] [ntext] NOT NULL,
    [application_name] [nvarchar](100),
    [last_updated_on] rowversion NOT NULL,
    [extra_data] [xml],
    CONSTRAINT [PK_dbo.ApplicationLog] PRIMARY KEY ([id])
)
ALTER TABLE [dbo].[Employee] ADD CONSTRAINT [FK_dbo.Employee_dbo.AdminRes_manager] FOREIGN KEY ([manager]) REFERENCES [dbo].[AdminRes] ([ad_id])
ALTER TABLE [dbo].[OrderNote] ADD CONSTRAINT [FK_dbo.OrderNote_dbo.Customer_cus_id] FOREIGN KEY ([cus_id]) REFERENCES [dbo].[Customer] ([cus_id])
ALTER TABLE [dbo].[OrderNote] ADD CONSTRAINT [FK_dbo.OrderNote_dbo.Employee_emp_id] FOREIGN KEY ([emp_id]) REFERENCES [dbo].[Employee] ([emp_id])
ALTER TABLE [dbo].[OrderTemp] ADD CONSTRAINT [FK_dbo.OrderTemp_dbo.Customer_cus_id] FOREIGN KEY ([cus_id]) REFERENCES [dbo].[Customer] ([cus_id])
ALTER TABLE [dbo].[OrderTemp] ADD CONSTRAINT [FK_dbo.OrderTemp_dbo.Employee_emp_id] FOREIGN KEY ([emp_id]) REFERENCES [dbo].[Employee] ([emp_id])
ALTER TABLE [dbo].[OrderTemp] ADD CONSTRAINT [FK_dbo.OrderTemp_dbo.Table_table_owned] FOREIGN KEY ([table_owned]) REFERENCES [dbo].[Table] ([table_id])
ALTER TABLE [dbo].[OrderDetailsTemp] ADD CONSTRAINT [FK_dbo.OrderDetailsTemp_dbo.Chair_chair_id] FOREIGN KEY ([chair_id]) REFERENCES [dbo].[Chair] ([chair_id])
ALTER TABLE [dbo].[OrderDetailsTemp] ADD CONSTRAINT [FK_dbo.OrderDetailsTemp_dbo.OrderTemp_ordertemp_id] FOREIGN KEY ([ordertemp_id]) REFERENCES [dbo].[OrderTemp] ([ordertemp_id])
ALTER TABLE [dbo].[OrderDetailsTemp] ADD CONSTRAINT [FK_dbo.OrderDetailsTemp_dbo.Product_product_id] FOREIGN KEY ([product_id]) REFERENCES [dbo].[Product] ([product_id])
ALTER TABLE [dbo].[Chair] ADD CONSTRAINT [FK_dbo.Chair_dbo.Table_table_owned] FOREIGN KEY ([table_owned]) REFERENCES [dbo].[Table] ([table_id])
ALTER TABLE [dbo].[OrderNoteDetails] ADD CONSTRAINT [FK_dbo.OrderNoteDetails_dbo.OrderNote_ordernote_id] FOREIGN KEY ([ordernote_id]) REFERENCES [dbo].[OrderNote] ([ordernote_id])
ALTER TABLE [dbo].[OrderNoteDetails] ADD CONSTRAINT [FK_dbo.OrderNoteDetails_dbo.Product_product_id] FOREIGN KEY ([product_id]) REFERENCES [dbo].[Product] ([product_id])
ALTER TABLE [dbo].[ProductDetails] ADD CONSTRAINT [FK_dbo.ProductDetails_dbo.Ingredient_igd_id] FOREIGN KEY ([igd_id]) REFERENCES [dbo].[Ingredient] ([igd_id])
ALTER TABLE [dbo].[ProductDetails] ADD CONSTRAINT [FK_dbo.ProductDetails_dbo.Product_product_id] FOREIGN KEY ([product_id]) REFERENCES [dbo].[Product] ([product_id])
ALTER TABLE [dbo].[Ingredient] ADD CONSTRAINT [FK_dbo.Ingredient_dbo.WareHouse_warehouse_id] FOREIGN KEY ([warehouse_id]) REFERENCES [dbo].[WareHouse] ([warehouse_id])
ALTER TABLE [dbo].[ReceiptNoteDetails] ADD CONSTRAINT [FK_dbo.ReceiptNoteDetails_dbo.Ingredient_igd_id] FOREIGN KEY ([igd_id]) REFERENCES [dbo].[Ingredient] ([igd_id])
ALTER TABLE [dbo].[ReceiptNoteDetails] ADD CONSTRAINT [FK_dbo.ReceiptNoteDetails_dbo.ReceiptNote_rn_id] FOREIGN KEY ([rn_id]) REFERENCES [dbo].[ReceiptNote] ([rn_id])
ALTER TABLE [dbo].[ReceiptNote] ADD CONSTRAINT [FK_dbo.ReceiptNote_dbo.Employee_emp_id] FOREIGN KEY ([emp_id]) REFERENCES [dbo].[Employee] ([emp_id])
ALTER TABLE [dbo].[SalaryNote] ADD CONSTRAINT [FK_dbo.SalaryNote_dbo.Employee_emp_id] FOREIGN KEY ([emp_id]) REFERENCES [dbo].[Employee] ([emp_id])
ALTER TABLE [dbo].[WorkingHistory] ADD CONSTRAINT [FK_dbo.WorkingHistory_dbo.Employee_emp_id] FOREIGN KEY ([emp_id]) REFERENCES [dbo].[Employee] ([emp_id])
ALTER TABLE [dbo].[WorkingHistory] ADD CONSTRAINT [FK_dbo.WorkingHistory_dbo.SalaryNote_result_salary] FOREIGN KEY ([result_salary]) REFERENCES [dbo].[SalaryNote] ([sn_id])
CREATE TABLE [dbo].[__MigrationHistory] (
    [MigrationId] [nvarchar](150) NOT NULL,
    [ContextKey] [nvarchar](300) NOT NULL,
    [Model] [varbinary](max) NOT NULL,
    [ProductVersion] [nvarchar](32) NOT NULL,
    CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY ([MigrationId], [ContextKey])
)
INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
VALUES (N'201711240454036_initdatabase', N'POS.Context.MigrationConfiguration',  0x1F8B0800000000000400ED3DDB6EDC3A92EF0BEC3F34FA697770C6ED243BC09CC09E816327738C891D4FDA39E7E4A921B768B79096D423A9736C2CF6CBF6613F697F61485D7929DE444A6AE7047E71F3522C5615AB8A6415F5FFFFFB7F277F7D8CB7B3AF28CBA334399DBF383A9ECF50B24EC32879389DEF8BFB3FFE79FED7BFFCFBBF9DBC0DE3C7D9CF4DBB57A41DEE99E4A7F34D51EC5E2F16F97A83E2203F8AA37596E6E97D71B44EE34510A68B97C7C73F2E5EBC58200C628E61CD66271FF74911C5A8FC817F9EA7C91AED8A7DB0BD4A43B4CDEB725CB32CA1CEAE8318E5BB608D4EE7371F9647B87D811E8BF9EC6C1B05188525DADECF674192A4455060045F7FCAD1B2C8D2E461B9C305C1F6F6698770BBFB609BA31AF1D75D73D3391CBF247358741D1B50EB7D5EA4B125C017AF6AA22CF8EEBD483B6F8986C9F61693B77822B32E49773A3F0BE328F988E7CE8FF5FA7C9B91761561CB7E11CA8FEAF63FCCE8D21F5A01C07242FE7E989DEFB7C53E43A709DA1759B0C5EDF777DB68FD77F4749B7E41C969B2DF6E69CC306EB88E29C0453759BA4359F1F411DDB7F85E86F3D982EDB9E0BBB61D995ED57430FFB10CCF6757C1E37B943C141B2CDD5868DF458F286C0A6A79F8944458E251FBFB1A231DDC6DBB028A5CCB22CDD0DF5082B2A040E14D501428C3FCBE4E1324E0CB618785324BF07F0A0CFFD41743F5C837419E8F3FEAF53873BD0EBE460F2573B8F1DFC6BB6DFA84109EFA47B42D5BE49B6857A98BA3A676D52E8D77591A7F4CB754CFA66E751B640F08EB9BDB54D26099EEB33587DBC9A25B86CAC5D940335E9D4D87C9962746A0CFFAACBB1DEA0245F1EE1C0FD320789914AF5EEAFA5C0549F080B22126F55D9BF8D42645B6B71FF44D94159B66D40B2C50B7516C0F6559045911064FCE807EC25AE6172C6E9C845A42390B4395BC629FC28894EA41DEC641B455AE0A4331D1C8E2A65CD78AC9F81805EB2DA2F7DDC87E81B6086B244B2052EBD69A2D57DBD6982EA96D6B8C9F29661FB21065D7692131BC6DF5AAB37B1D7A62AD607C812690F9D5A2788BF5BD0245522D4791A98551649BD8A2F811AD51B42BE474A41A806842F502A260235B5497C136C89EE49876F520A240B58027D4C616CD5FD2EC0BD60F3F45D8C7CA2209AE4CA327105F49130167593B275FB1157E6367B1ED3199B7586280B1447D7C46A6F3A17A8EBBE029464971858A4D6AABE13950B7189DED4D16AD111EF836786C9D06B48EE2009BD49B0CFF571FD7FC389F2DD70181FD5FF65EC9FE4EE78FEB5D0133CB17E5EB749F146E8439DFE75E44406BEA4718A514EA824CDE8D26159CA8F38C7BBB969DD80D2670E7A5BE42D90DE509FB1E03C37E13ACBFF8832FB526CD6C343E4ED70CF2719A5AC109039AD8BA619DE9F2E184C91114EC9FB59F78810ABC59D0788B55A31565FF007CF94672DF5168E964953B2E1B1AE5A6C36436B9D6A6B6D6D897121EC80E4F724830D61E74940DB51F5BED79AF6BBCA334D4B6F21DA5A090BDEF28A52832B58A1DA51245BB7D048167B78F203DA6DD4714A8DFD933D3592D967A5D7419A292A0DF9DF9EFCEFCFC96CCFBC36F89A0EFBEFBEECFD677B751D5A06B0C6B737FBEBBCDE9A41C4137DFBDF6DB35568F6AB5A2AC0E8731D80AB68270535B837D5BEDBE95F4ADDB40C42DAB1494ADEA21B2DA99686AB276969AEA7888061B6C8F4BC2FDBA306C7DBE09A2CCB02D662C5A630BBEC484CB8D7A547BCC49BD0C931D0F45B243DD94B57C1A831E1CA3BD6F053DED534BE15220372DC7FCF878FFD80789AF1D6029436636A66EAAB02F650B58778BCD7A59C64A5D0F6111B5588BC6D314F35A9598E1DD3656605DB7D1E3DC3474329735DF4D0FE048EBE94EDF60D36570FEE64B979AEE60CB01AFF7F15D17E3D4F35ECB7097E4DBE53455075A5793D51AEE6E66332CE76252C5C2C2A1EB9CD64A3DAAE15A295B4FB656CAD1FBAC95B6E3586BE532C79BF0C4FEDC13C2DBC7922BC5E52C76B7E43769FEAB3384CF6E103071A344D41ED650CA75ED0EE67DBAFEE2EF80BBE414ACD00CD404AFBA2015E2FD1C5BBB37969F60CB31335660ADFB61A8C2EAF6932931E9CE56AFC69EC10E6F926BB7CBE43E75BA0F3309631DF65495809DE2A28DA7641C3CA0F751F24541CE2B7279E14C4E3F1B4BBCB74FC2201B6C8F3FB0476AB375D27AA5FC1E6BD0E00B19E662136DE0455FBCEB7E2AAC992610CE60030163B8959FE0CD0AA87D0867D5EF1003397D5BBD6711F6F90C4CF3E11DE551115CFEE3BDA4616AD2C8306FA763FDF4A40E612F47638C2AB3F59927D6393761397E2FCFB9EB7AA8CB73500DA2F1FA1E06CA9636572517E9BEDC44DAA63E2651F12957ED384C9DFFDE4AEC3279C85018A1045608ACEF40379679215D1B4125481BFA54613D9D2635AE5E94174D3D43CDD575994C6DD5ABCB56650DB628FDA8AB5F820C6DD27D3E9057E674CAE06BCDDB1D33BCF272CC80B5D97DDA9EF6BE792A7AA973FA38613C02116DFC66FF34FEC0CD31C0B067349E4399ADF7AF96C643BD8B05AC4C8F7C5415F24233C90454ED5459AAEE13213AEC27A2C340FC29C054C30E6FA85EB082602327232850C0D8160A3D2733891F13C363839EB6B3827FA8A6F3C02D7B8F1D3E3FC102C5C3AA625F51539E9C7C2FAA8E571D467AB187CE369C01D3433505FAE100FD1CE8D6BEF4601F0D7850BAEFB96BB471B22B2E131F2FE79429126C28C480F905CAF0FD5EEF76289658FF20FEDE2E5D2F2DA177EA209DD24B4B509E9BA18E687B4CA62198ADB5ADA218785FEE290E3C4D309B85C33FB34D9EA4B387033C58E87BED037811576E167A4976F70E8EB168775D2693ED652FEBB7FC5D583FDBE3088CE80D641035CBA814829F83ED7E38F79CBC77445EA8733CDD7F97665778B16FDC762318CA67143806505EE6374114DA1DCBF5730A7A3C91C5BB04AA67B48CCF467A3C9145AB24E9235914729A67B2A8966E3E0003D6DC1160BA4DE70D6C7AB9019B43D6981F518EA955F1F71B49FD2E5FF6BCF591C3FD3609FBC1E9A76F1C9EB9E3F58EEE393C537C693DE25FEB68B006F4532FAD73B6DBE1E55FE2FE3E7D307F6E9DE936DDA5659F1BCB11132CC8AA380BC3EE36A6F7723B4FE3187567010E01AFB68FEF769CF6749FA91EEF7D90179F762121F78776F7F4264A4A1D4CBEBBB0CF3294AC9FAE4A88E5700C167FE670E89D168B29BEDB9717691A45F888451AF335F01C8C2C5BC267799EAEA312754E71B6AFE7B2F8624D3DD33DA55B214E3FC58BF1C78B3622CCC7489CCEFF20D04101B775993AB8EDCBBE2CD8170258BCBA51469657B0C5ECCE3171A3A410554194ACA35DB0D560C0F5039508F4E90642FE760CBEE602ED5042348086AC2683B7CFB18BE3B7C3700A4E47A0930525226AC9019E0E91F158F58E48C7652A3BD85C7C54AF4975A0BBC74D58C8C747479E84488E870927C107EAACE4484E62A7F14795A3567DE8992D3A68DEE4487CE258AFE08690231E0F133E829FAAE829473C899DC61F418EE8DC411997C17C634A4D54E9D3E65203262676F0EAB4C1A1640518DD8449921C632B310108693C749D173F9DB21133E6955A41F19A06A77498F78B2C758F22495F23A03E358F140B232B227DA3C852FF4829EE88C51402D6592363F6030FA00C2468C0E363067674288113B03161B7FAD92D07C113B8E0019BB10410CC29524A853AC188130A3A32CF52FAD40F5703E30C297C2A648CB92D4D11B4943D15073C203381E8358915A60221E4590C2276420A6C374A9B09328AC8718898F0589A63EA246E1CDD9D111941D494E1883249308B4DECC401884336173BB398EF6E303A9C7210F13341C884F560C0B295FC99F0C109937105507F6EA18E720305AEA7A84D7C7AA1C2649CF30B15A90FFD04431D7B68AE68C070E5C1D41A18F66824D3832936002513DE4B72365C141BC00A174C461042301650260DEA042113E3A6923575D861079D8A591C44C0547898705311ED6A255E2A6A7BC06304E19266FBC944409F372E78EFF63A4D9F5F38A29BA643661C174D47F74377CFE00C7F3301506C433D89D8645B50251AE36D4095F47E0EDB4FE93367C627AFBAB30E5F27BCD39E76283019F9B84341FB672370D453A44AFE43DFECF0763D3ED565A7040313E6F9B8F09410D678F8C92F3DAF994FC6690F4BF5913AB6A71400E8E92275403C4C98E929520724B1D3F8A3CA9159A48EF6BCCB518E0E205267C2932E39890FFD9C0BCAFF91715B990CD4B19B8E90371725551691812C7912240516E3489282C6872E4AB2D40E19C7B5791ED4A9129753652E56BA249151D594069971244C43F667266594B2311401283767004983120F4D74E460D2262264C26A2883DA45DC44EA1B9DC133197C23C85D95B251E7FEA3ACC930C8D3DFD096802AD023F42AE4A71CD57956799D0AC24B0B01BB44459BB250261AE4F3599723C2E7590802C78268D62F04A3D3681A20ADFF0241A13C430D98C68986A0749B09135CEA57ED615CAA0DB30918F68D7C181A73BAA39B60FDB91471765530A8A67BB9FB84BAD7FB754DF7FAE00302D09E1F9932BA7D7745CEEEE664D50C2B3940EEA056038E791F4380451FF96B00418FCC08F080FB5773B01A805A50EDC5110488BA48D380E9542A0487B6343A7C84247C112BCE3C6A20B2E9A5A09AE3F2563980947A16555E9B2737A39A71AA0FCEA5630CB7349BAE9D0DA36505EB63903F4741EA543E9FF0CACED5800E40D61740095D6E98E46C513873A2E640AB68053914F9601430CA6878A44867FA541481F7289249081B14178A081B111361EB4111E62B5E2229A4893A0CDA50AA0ECDC1DA2A2A260E25E750101AC3E8470080AF304A8440937DA2BECE61F34F7861605D0F9D4CC8334EB474F64125CAAD32A094248D423D2B3191C21FC5C4D409A3A5D997726044BF8C70FAF07FF844559A00C04F8D717074545386FC439087205AEBACEA4906DEE52AA7C55FE6FA22177F794BC1EDFC726752A99F7615E9651E7BCD4CCE28FA9A9A21E44B2B6867146F4D81677C7E9F3454BA01FAB061D9A494AE00BB4130A3D268EE80E6494D130193C6C16A44008A84F5296250ECAB215B7A10127EA651A49F3E849399963288D36CC5E8E101D4A1B7A2CEB491461602F4318B4264E6A48D431455B3894469230F07535870809C96587ADBA88EA5F341A671ACA234C4CBC45B357421540161FE3CD511E9457F2C59B507D66DFE64614C2EBBDF9136826C9C8DCADD343E1B81E3718C3C671DB031CE46B44E912EAE443209EDD9880D45C67286C0B74F45926843248C8324A8793087B60AAAA8C22206228BF4894691344657FE5697FEB44F221C472BE8A4BBE71F8756F461BB965AB2AB6BCBCB6B4F1403EEABCDC45541B5E6E9BBF61EB5AD3B592CD71B140775C1C982BC088876C53ED8920701B779537115EC7618CBBCEB5997CC96BB604D4E16FFB89CCF1EE36D929FCE3745B17BBD58E425E8FC288ED6599AA7F7C5D13A8D1741982E5E1E1FFFB878F16211573016EB9C263D7FEBDB8E8409143C20AE96BC2C18A277519617E4D5C0BB806C00CEC35868C6DD1A4B6E4C9AC1B88B61917FCD054AD381FC5FFB911F9647F52847926B8F8E7EEFF094C84B94E5EC90784121F6C47DC913DD41C6BF2C59A6969CA7DB7D9C542541B88A80A80139884F39CA92F2554A1ACCBE2D35877413E4390B6557969843B816F090E170B2E06829C42508DCE2560ECF7D23D9E8F4575FE190E96903E9907795D1B30E16A2094A5C403B01C13DC86A13C1ACCB527340ED3B8D34A058F678A31CCEF394581984375146DEBDA741DC5545E630CA27A9CB4FE6D060F2B6D41C1279CBFF17CC1016D20697AE7E2B8BCD419D8561C6EBA6D08AD16FE3322A80953B205040C9E24DF94A39C3E30DF070B91A8F1DB1DBE20AC85231744405A8FDAE240D286C0A0F46CB51BB86BE6A4E7ADF62A0E7147D6584651EFDA1899B3615964A6F173C11DCAE50B149435E453CADE2BADC1C60F931AAF25379D769724BDE32A661166DED2AA9AB2D56FFFE0E50F479596A39ED8B285F57DFCB6224B42D3587542768D060D6FBDC121D2FF6AB7A8BAC3A8C1144A380A2BFF4D0225EEBA75D711F9900A461B5AB2AAC485E9E58DCF08660DD1C73ECEC8C0106F426587F11C5FFAE2C3D187DD51DD5F45557B22328036D25EF3AE8D270773CFC5846770BED4FE73C27F35A1DD93A9957280CC4D4BCC27DD54A0F89DA386D2A2CA5F7BB359CCA1AD259B80CCDCB6B81144ECFD549C677737848E650BC2773523374907E4F6DA304319AD2A11E2F603858DF0BDA016B9F576624AB0C1FB403B4C4F6698D0D14DEC317DC61045765E11C94A7E08C730004A1AB20F8537DD547C66928FF2C4B0E66B9D4A19DBD5D472876D5C46F84FB0D2E6F25A0EB7D7CC79FC455C092BA66708B3211B7EB5BEEBEDC066FEC0DB82DE9A7A429CFED8AA076DCBECC49B6A0E01447F9AA2DB7E434243A1566F6A253CA62F3856E511683D856D9DCA4F9AF9C764FF3D5AF96203E8B203E5B123D4A84F540685E17DB802ACD2000AB2DB701F63E5D7F016035C507B34ADB809CBEEB54127964B052A53D47712BDCB7F597C97DCA31B82CB1F1930417DCDAF9265CE174445932DC665E4A8F387840EFA384F3DBA96257AFE8A28757D47CE21CF0FAF2225CE5328F6FEA1B81264CD1F95EA04EF974B81D904118ED8EC0EBC2FF1D39DC5CC4ABA38AEF2D489AFE52AE87650781EB55F19422543F34CAA8FE07DB701073E99141F89444C5A79CBF9DC7852B20A3BA12A349C4900E24EF2B83F2A079030154751E94C7CC03C834A8DF9A8A67E8B56091BB4FB97DC9BE2EB35A43A2EB42286CEBBE9055F066FF04AC82BBBDD5A963E329005E595E57D99F8D3E939B122031A9EF4A155F9BB05FB006306404AF5EB2A7A99D25CF53BD5F1628066431C2C5F672687E5039BD047A913D37A91B55DEBC5C375D2642585A9458C6A495F742D029517531243F259A4866A884BEBE1223CD5734901745DFD11C823A049B3BD46B0AED8D1F088F6C94153027E23E1DAEDF97FDF2F40403FEAB3A4BE92CA88B7C127571111448B8AF0D71A1ED5D6D45849F83ED9EF799CA8AD5D7AAC6C2674EB32F2438965B1FB874B5298BCD41BD4BB32BCC682EE8173BAAABB82AB602F519059908E9A92CB53AB20E22F1607817C0FC9B4AB3F24936BDF52BFB96560F25AB012015A38DA06237966B847D909131F165CD2AAFAB465EBB6510FAAD100A9277C5160825A10809358507238FFC1B6B7DC5917B89CD5E1C7500A4CB9E5FF2D6DAFA2C0C857D24D1D741556EE332C4646ABCCB50175AA41D74A4108F2582AE72657B44F13EC88B4F3B32B9F003E7896C71D56A5FD5AD522B0FE7ED63910524898D937552BC0ACBF291C55DC81CE49BB4A3D725EDEF3673B0CEDA63D2094B0290E4C072E2799D41C8A7F1554DE6334CA5AF514852F8964F39DE5A1E910647CB7F6ECFB7D573164D83AB2089EE515EDCA65F50723A7F79FCE2E57C76B68D82BCCAFCAC13145FF3EFC51A652CBE7845321651182FF8EEF6798F044A9E87CC9901A520DAA499FA5945E17D5BBC93428FA7F3FF9EFD0F97C6F877F4C4B3BF91B1EE155F302DF064C1F73DE1A4B3EE563D1AF935C8D61BE2565C058FEF51F2506C4EE72F8EE7B3EBFD764B0200B0E7116C81473339985DA2961CEC9FECC156995B5E413A6349AF4325DBBB446FCF7C87CDB89EF14D3FAF9CEF92062BB01159C81D8CF2D1660D88365D90434C4E36D2EFF5ECF2D755DDF587597911F87A768C29FABB14E5C413CC3A4DB1024A6C9F35842E43D10108959C088A9511902A3551411FACC66D65B5CE84502D216B987586861CE6CB1E6836898CFDC9D75E1D988230D68CD42B8F9E55A3EADA5FAF20D9DE5ED5249D60D89F25401245052CC612F464BF54BB040A95F0594B5F17E1D07FAA4D2A85BD4DA87A1A9A04D3C5D40F95AAA74754E8FCC6FEB4A532393A1D5DFDEE2390CD15918B28B2F91B2E90BAE40D7328C69AAB7BFCCAB3E2823387F42A4BB24CDC94D5108EC52046CEBF2DF6A1BA06369CD5BBD243184E49FE8DA1E12C583D594EBB3CD3FA1B4A50468E516E82A2C006961C51A1726ADF0DA0F5CAFE9D1B4026018522AE012E545716A13E26F8BBF1ECA9BD98CF038DA8C4C00EAA984CC8484B53B3A02F7DA913FD801E50988C83EE355812745FD99A30931B8A90F65AA2EBEDF320A7E3961D519A7E4E04E1B8EFD797AA04457596640FD387C9AAC2CEBC7B3DF537477C7BDC92C56CE0734382E5DBD36133371D8E0C463698C65CAD9F52F6CC55593EA59EAB5DCF01B94AE768BAF2D45D36D88CCCFE70EA7C4C37009F5D005079984E40DA044C27284DEAA5774D78D3BCD3EE79D5C8FD20FDBA5198FEC33B85A812101430FB1CDFBB3BF05522C288270E22082A779225CF7FC4C1E37FDAD2E4C2833741E54CBA0881FDAD44F3E5CA11EF26BCAF4AE55586E9CEA0EEEFD3293FC48DC201BBBE37ECB75E7DAB7D697EA381DAA7FAFABD293B4009697272ECF1A97AFAC48596B4FB6D1AD8CB6A97B7696E085D8498CA89F42DC170B2945E7A250C75E30C9B58612F2B747F9F12A375A4F4BCEEE149BDB2F7A49AD4CE0A6A11254FBD1CF036B3D3F394BB4C4FCF80F99C4F175772B8CB27E0DBDE9E57B3249DCDE3BAAF47B05F9B65C7DF8349E9B5E2A83C5117D9B53CD774387C62BED2388614F7154DF7E0CC03B9B8AB33441D6202D9CCD001EEA7A80F4F7A160955CAA55E32947E85E31D49936A29F1274D38CBA46C9AFBA5C66CA13F02E5992F6042A49E21F9F35DAA663E449B9C29BFE136920C262FD3C5325039992E3B1F2A1FB3BFB5EB52319D0E89AB344C1B57D75C91B1898CDEB51994DD68A0C636FE570D971DD9C3AFA3017C9B213354B2A663C04A9BAC6905C7586CB98447EF67057DCE0986BD0EA4B32A1D79D36655D67BD3F2DB78D61913422AA5DFAB1221A7B2517F31C2524A228224143E4FE3DDBEDCD6DA8A2C9573590DF6186FFB6D22A8CF32D6C0DBAF6282DFF8A3BE0DD966005628945FAF6CCBAEB0028A08DDF19898AAC28C3A305D461905A72B6401FD4100849702CA88A406E4E38939264C24669992EBE975B40BB61CEA5C3B708549BE5378B26881F235176887950AC97EE66668329CF43373278B162EB7DE7524603EBEA9667EF7F565F86B3114DFBAA8718A6F5D21CBB7E3A323950C5021C01430AA741029507C4B0788AC917C05C3420E54DF42B1197054398085B7EFFA3D4839B05A9FD240CCA1E4403EE008725046A9415F7FA798764B67EE940CAB4BAC585FC7C3D1BAA42A1984E5B2D7F1CD63AFAC382EFBF4826C38C9B708C65BFA5440F30A40DE9E6FDA55CF8450F38B9FA91CC616187348112F6DA902D4DFABB11B790AC190E8B1FEFAFCD085C44E716B02F7071616DDE863094C77B3B6927C2E9567F2357561D271B72AB59417FA5A0F02D8D40D272D92A7F1AC03A92CA545F97AACFDE01308CB0DF4750B8ABF6DD428C5D7B6EC3989093851099F94A93DC38A887AE8110444B8A95FC99E25A7D84B47E9509CA58BCD65058815A06002B583C88BF22577D3A0022B71317991DA66E0718565DC1D2C73070F4BC737B28B55BF157D60FB58517948D17763E6E1EB0F5BBEC9E29786D61FD2714710974EC7AE248F54536CA5222C287652A5E612626DAE3CC984EA156FBBC00F2BC1B03465BA7147100C26747D7407840B9C173DDF6FCCF1B8D17C38E9C09C0E563846DAC04C2B13136C5EEC8562F2AD8B707236E6E676E233B3A9B6B7B6E765872124A5748C71DD32CD4DDBC8D72E76E7B50772F552EE59C7BF7D373F757DCEB7EFC6BB9EE96FDFC73FBB98460E26B97D7F1EA7165D90B867415049011D994E81A28BBF0939507EBAE8C004818D7D1E572BF071D7F4190757F54DC885F68B3B872D1B32B17659E1072E21962B59F2C1B0614544F3C5A30124E52DFB6D9426A08BFF8E892025F5E7569AF0F526A0B70B1FE6437DAB2FA19CCEC33B923B5D0520D795C2138102FC4E2909037455D0085DAD6604CA7F1186A0EAA031A86ACD209DE72D8CD155414374B526D3A8B666F034AA3AE934AA6A9341983301782CA6897448A6958E8055D09848BDAA1C245D55A5015C6F8E05C0753904B8AED2006ECF6304D06D0D04BCAD3415DBE6FC4E2EBC4D0BA508379F25369C967454AE5E3145D311E9B3706138BA121A8BAED78C035CB009C3016DA05181CF3D5B8CAE1E573BA27628EAEA491888AA8386A1AA3583D0DE82300A5D090D43D7EB26C37910E28CB806E0B4B8369A31F99C2DD1F6710D4013C8B5E1C6A4ACB6680DDBDC9B19D58C338B707E0EE39871C6BBFA005F5326B820D0F681EA2835B80B762A06D304B24C8089EA725124E76114CA32E32A3B09A5BACA6DA6CB743B1AAAA62BDBF1F4E5D0C8D3A5730680794A530AA0536E0A45D02AB33240FB109500802E424F0E8A31F1322E6AA2E7FB20ADB9D7E159A972BD3C4C9F12170312488FE1FB8BE5F4E400E39A65D4D00741CB0E62F999403613EECBFA382C84A6CE3B295AEF564F08C9C520740B4A4D41E23E4F4802655C2A4007F338566652A2975CCE47EEFF32BDA5BE6F0904A8F54916A5D9D3476A7A327C8003CE4F7E106960E09B88832240CF6D3A134B0418540750441F7CC79E3EF2BB9DEAB3E7B28D8CDBA2EA316D69C8183075B3F0328F7A01DCEDD38AD61BF7E1E0282D0D86B312E34D5D1AFE63E23C0D6C26C7769BA80017E51E6888FDC1483B3D368043E5098DB0B135F7229DA6ABDDD80E6FDF879F2E741D0FCC577B6BEF69C2E2095CD95771B6663F65D9C533306DA33B6A4F53870F052BC3AF3EEA7326014D5E2D11E437932E7C1C9C14CD6341EDE5615B77B2A88E3AEB02FC13830E1ED0551AA26D5E969E2C3EEE13F2F851F5EB02E5D14307E204C34CD09AB9AC6CDB5C26F7697375CA61D434E15E42BAC2168ABC83749615D17DB02E70F51AE5399EF57CF63379A18F08D41D0A2F930FFB62B72FF094517CB7658841EE5E55E39F2C049C4F3EECC8AFDCC714309A11793BEA43F2661F6DC316EF77C0A3631210E452B77E5E8AF0B220CF4C3D3CB590AECB8F949A00AAC9D7DE4513B3B8C5C0F20FC932F88AFAE0F62947EFD143B07EC2E55FA390D82C19103D2358B29F5C44C14316C4790DA3EB8F7F62190EE3C7BFFC0B888302B1466E0100 , N'6.2.0-61023')

