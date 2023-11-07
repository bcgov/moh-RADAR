
SELECT ST."Code" SftTypeCode,RadarType."Description" RadarDesc,PC."Code" AS PrimaryCapability,SC."Code" AS SecondayCapability, REPLACE(REPLACE(ST."SoftwareDescription", '<p>', ''), '</p>', '') AS SoftwareDescription
FROM public."SoftwareType" AS ST
left Outer JOIN public."LookUp" AS SoftwareVendor ON ST."Vendor" = SoftwareVendor."Id" 
   AND ST."Status" = 'A'
left Outer JOIN public."LookUp" AS RadarType ON ST."RadarType" = RadarType."Id" AND ST."Status" = 'A'
   
INNER JOIN public."SecondaryCapability" AS SC ON ST."SecondaryCapability" = SC."Id" 
   AND SC."Status" = 'A'
INNER JOIN public."PrimaryCapability" AS PC ON SC."PrimaryCapability" = PC."Id" 
   AND PC."Status" = 'A'
where 	ST."Status" = 'A'									  
Order by ST."Code"
										
