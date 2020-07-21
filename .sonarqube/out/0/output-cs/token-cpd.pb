¸
_C:\repos\PersonnelMapping.ProcessCoordinates\ProcessCoordinates\BusinessLogic\ProcessAddress.cs
	namespace 	
PersonnelMapping
 
. 
ProcessCoordinates -
.- .
BusinessLogic. ;
{ 
public 

static 
class 
ProcessAddress &
{ 
public 
const 
string 
NoStateCode '
=( )
$str* G
;G H
public		 
static		 
void		 $
UpdateAddressCoordinates		 3
(		3 4
Address		4 ;
address		< C
,		C D
string		E K
response		L T
)		T U
{

 	
var 
coordinates 
= 
JsonConvert )
.) *
DeserializeObject* ;
<; <

RootObject< F
>F G
(G H
responseH P
)P Q
.Q R
FeaturesR Z
[Z [
$num[ \
]\ ]
.] ^
Geometry^ f
.f g
Coordinatesg r
;r s
address 
. 
Coordinates 
=  !
new" %
Coordinates& 1
{2 3
	Longitude4 =
=> ?
coordinates@ K
[K L
$numL M
]M N
,N O
LatitudeP X
=Y Z
coordinates[ f
[f g
$numg h
]h i
}j k
;k l
} 	
public 
static 
Address 
FormatAddress +
(+ ,
string, 2
streetAddress3 @
,@ A
stringB H
	stateCodeI R
)R S
{ 	
return 
new 
Address 
{  
State! &
=' (
	stateCode) 2
,2 3
Street4 :
=; <
streetAddress= J
}K L
;L M
} 	
public 
static 
bool 
IsEmptyStateCode +
(+ ,
string, 2
	stateCode3 <
)< =
{ 	
if 
( 
string 
. 
IsNullOrEmpty $
($ %
	stateCode% .
). /
)/ 0
{ 
return 
true 
; 
} 
return 
false 
; 
} 	
} 
} Ë*
gC:\repos\PersonnelMapping.ProcessCoordinates\ProcessCoordinates\Controllers\ProcessAddressController.cs
	namespace 	
PersonnelMapping
 
. 
ProcessCoordinates -
.- .
Controllers. 9
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str "
)" #
]# $
public 

class $
ProcessAddressController )
:* +
ControllerBase, :
{ 
private 
readonly 
string 
_mapsApiKey  +
;+ ,
private 
readonly 
ILogger  
<  !$
ProcessAddressController! 9
>9 :
_logger; B
;B C
private 
readonly 

HttpClient #
_client$ +
;+ ,
private 
Address 
_address  
=! "
new# &
Address' .
(. /
)/ 0
;0 1
public $
ProcessAddressController '
(' (
ILogger( /
</ 0$
ProcessAddressController0 H
>H I
loggerJ P
,P Q
IOptions 
< 
MapsApiKeyOptions &
>& '
options( /
,/ 0
IOptions 
< 
HttpClientOptions &
>& '
clientOptions( 5
)5 6
{ 	
_logger 
= 
logger 
; 
_mapsApiKey 
= 
options !
.! "
Value" '
.' (
Key( +
;+ ,
_client 
= 
new 

HttpClient $
{% &
BaseAddress' 2
=3 4
new5 8
Uri9 <
(< =
clientOptions= J
.J K
ValueK P
.P Q
BaseAddressQ \
)\ ]
}^ _
;_ `
} 	
[ 	
HttpGet	 
] 
public   
async   
Task   
<   
Coordinates   %
>  % &
GetCoordinates  ' 5
(  5 6
string  6 <
streetAddress  = J
,  J K
string  L R
	stateCode  S \
)  \ ]
{!! 	
if"" 
("" 
ProcessAddress"" 
."" 
IsEmptyStateCode"" /
(""/ 0
	stateCode""0 9
)""9 :
)"": ;
{## 
_logger$$ 
.$$ 
LogInformation$$ &
($$& '
ProcessAddress$$' 5
.$$5 6
NoStateCode$$6 A
)$$A B
;$$B C
return%% 
new%% 
Coordinates%% &
(%%& '
)%%' (
;%%( )
}&& 
Address(( 
address(( 
=(( 
ProcessAddress(( ,
.((, -
FormatAddress((- :
(((: ;
streetAddress((; H
,((H I
	stateCode((J S
)((S T
;((T U
_logger** 
.** 
LogInformation** "
(**" #
$"**# %$
Loading coordinates for **% =
{**= >
address**> E
.**E F
FullAddress**F Q
}**Q R
"**R S
)**S T
;**T U
var,, 
responseMessage,, 
=,,  !
await,," '
_client,,( /
.,,/ 0
GetAsync,,0 8
(,,8 9
GetUrl,,9 ?
(,,? @
address,,@ G
.,,G H
FullAddress,,H S
),,S T
),,T U
;,,U V
if.. 
(.. 
!.. 
responseMessage..  
...  !
IsSuccessStatusCode..! 4
)..4 5
{// 
_address00 
.00 
Coordinates00 $
=00% &
new00' *
Coordinates00+ 6
(006 7
)007 8
;008 9
}11 
var33 
response33 
=33 
await33  
responseMessage33! 0
.330 1
Content331 8
.338 9
ReadAsStringAsync339 J
(33J K
)33K L
;33L M
ProcessAddress55 
.55 $
UpdateAddressCoordinates55 3
(553 4
address554 ;
,55; <
response55= E
)55E F
;55F G
_address77 
=77 
address77 
;77 
return99 
_address99 
.99 
Coordinates99 '
;99' (
}:: 	
[>> 	
HttpGet>>	 
]>> 
public?? 
string?? 
GetMapApiKey?? "
(??" #
)??# $
{@@ 	
returnAA 
_mapsApiKeyAA 
;AA 
}BB 	
privateDD 
stringDD 
GetUrlDD 
(DD 
stringDD $
fullAddressDD% 0
)DD0 1
{EE 	
varFF 
urlFF 
=FF 
$"FF >
2https://api.mapbox.com/geocoding/v5/mapbox.places/FF J
"FFJ K
+FFL M
$"GG 
{GG 
fullAddressGG &
}GG& '
.json?access_token=GG' :
{GG: ;
_mapsApiKeyGG; F
}GGF G
"GGG H
;GGH I
returnHH 
urlHH 
;HH 
}II 	
}KK 
}LL ‡
bC:\repos\PersonnelMapping.ProcessCoordinates\ProcessCoordinates\Infrastructure\ThreadIdEnricher.cs
	namespace 	
PersonnelMapping
 
. 
ProcessCoordinates -
.- .
Infrastructure. <
{ 
class 	
ThreadIdEnricher
 
: 
ILogEventEnricher .
{ 
public		 
void		 
Enrich		 
(		 
LogEvent		 #
logEvent		$ ,
,		, -$
ILogEventPropertyFactory		. F
propertyFactory		G V
)		V W
{

 	
logEvent 
. 
AddPropertyIfAbsent (
(( )
propertyFactory) 8
.8 9
CreateProperty9 G
(G H
$str 
, 
Thread  &
.& '
CurrentThread' 4
.4 5
ManagedThreadId5 D
)D E
)E F
;F G
} 	
} 
} ÷
QC:\repos\PersonnelMapping.ProcessCoordinates\ProcessCoordinates\Models\Address.cs
	namespace 	
PersonnelMapping
 
. 
ProcessCoordinates -
.- .
Models. 4
{ 
public 

class 
Address 
{ 
public 
Address 
( 
) 
{ 	
Country		 
=		 
$str		 
;		 
HouseNumber

 
=

 
$str

 
;

 
Street 
= 
$str 
; 
City 
= 
$str 
; 
State 
= 
$str 
; 
Zip 
= 
$str 
; 
Coordinates 
= 
new 
Coordinates )
() *
)* +
;+ ,
} 	
[ 	
Required	 
] 
public 
string 
HouseNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
Required	 
] 
public 
string 
Street 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
Required	 
] 
public 
string 
City 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
, 
MinimumLength &
=' (
$num) *
,* +
ErrorMessage, 8
=9 :
$str; U
)U V
]V W
public 
string 
State 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Country 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
, 
MinimumLength '
=( )
$num* +
)+ ,
], -
public 
string 
Zip 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
FullAddress !
{   	
get!! 
{"" 
return## 
$"## 
{## 
HouseNumber## %
}##% &
{##' (
Street##( .
}##. /
{##0 1
City##1 5
}##5 6
{##7 8
State##8 =
}##= >
"##> ?
;##? @
}$$ 
}%% 	
public&& 
Coordinates&& 
Coordinates&& &
{&&' (
get&&) ,
;&&, -
set&&. 1
;&&1 2
}&&3 4
}'' 
}(( ¥
QC:\repos\PersonnelMapping.ProcessCoordinates\ProcessCoordinates\Models\Context.cs
	namespace 	
PersonnelMapping
 
. 
ProcessCoordinates -
.- .
Models. 4
{ 
public 

class 
Context 
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
Text 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Wikidata 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 

Short_Code  
{! "
get# &
;& '
set( +
;+ ,
}- .
}		 
}

 É
UC:\repos\PersonnelMapping.ProcessCoordinates\ProcessCoordinates\Models\Coordinates.cs
	namespace 	
PersonnelMapping
 
. 
ProcessCoordinates -
.- .
Models. 4
{ 
public 

class 
Coordinates 
{ 
public 
Coordinates 
( 
) 
{ 	
	Longitude 
= 
$num 
; 
Latitude 
= 
$num 
; 
}		 	
public 
double 
	Longitude 
{  !
get" %
;% &
set' *
;* +
}, -
public 
double 
Latitude 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} Ÿ
XC:\repos\PersonnelMapping.ProcessCoordinates\ProcessCoordinates\Models\ErrorViewModel.cs
	namespace 	
PersonnelMapping
 
. 
ProcessCoordinates -
.- .
Models. 4
{ 
public 

class 
ErrorViewModel 
{ 
public 
string 
	RequestId 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
bool		 
ShowRequestId		 !
=>		" $
!		% &
string		& ,
.		, -
IsNullOrEmpty		- :
(		: ;
	RequestId		; D
)		D E
;		E F
}

 
} „
QC:\repos\PersonnelMapping.ProcessCoordinates\ProcessCoordinates\Models\Feature.cs
	namespace 	
PersonnelMapping
 
. 
ProcessCoordinates -
.- .
Models. 4
{ 
public 

class 
Feature 
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
Type 
{ 
get  
;  !
set" %
;% &
}' (
public		 
List		 
<		 
string		 
>		 

Place_Type		 &
{		' (
get		) ,
;		, -
set		. 1
;		1 2
}		3 4
public

 
double

 
	Relevance

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
public 

Properties 

Properties $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
Text 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 

Place_Name  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
List 
< 
double 
> 
Center "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
Geometry 
Geometry  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
public 
List 
< 
Context 
> 
Context $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
List 
< 
double 
? 
> 
Bbox !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} î
WC:\repos\PersonnelMapping.ProcessCoordinates\ProcessCoordinates\Models\GeocodePoints.cs
	namespace 	
PersonnelMapping
 
. 
ProcessCoordinates -
.- .
Models. 4
{ 
public 

class 
GeoCodePoints 
{ 
public 
string 
Type 
{ 
get  
;  !
set" %
;% &
}' (
public 
Coordinates 
Coordinates &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
} 
} µ
RC:\repos\PersonnelMapping.ProcessCoordinates\ProcessCoordinates\Models\Geometry.cs
	namespace 	
PersonnelMapping
 
. 
ProcessCoordinates -
.- .
Models. 4
{ 
public 

class 
Geometry 
{ 
public 
string 
Type 
{ 
get  
;  !
set" %
;% &
}' (
public 
List 
< 
double 
> 
Coordinates '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
}		 
}

 ®
TC:\repos\PersonnelMapping.ProcessCoordinates\ProcessCoordinates\Models\Properties.cs
	namespace 	
PersonnelMapping
 
. 
ProcessCoordinates -
.- .
Models. 4
{ 
public 

class 

Properties 
{ 
public 
string 
Accuracy 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 

Short_Code  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Wikidata 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
}		 ü
TC:\repos\PersonnelMapping.ProcessCoordinates\ProcessCoordinates\Models\RootObject.cs
	namespace 	
PersonnelMapping
 
. 
ProcessCoordinates -
.- .
Models. 4
{ 
public 

class 

RootObject 
{ 
public 
string 
Type 
{ 
get  
;  !
set" %
;% &
}' (
public 
List 
< 
string 
> 
Query !
{" #
get$ '
;' (
set) ,
;, -
}. /
public		 
List		 
<		 
Feature		 
>		 
Features		 %
{		& '
get		( +
;		+ ,
set		- 0
;		0 1
}		2 3
public

 
string

 
Attribution

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
} 
} Å
\C:\repos\PersonnelMapping.ProcessCoordinates\ProcessCoordinates\Options\HttpClientOptions.cs
	namespace 	
PersonnelMapping
 
. 
ProcessCoordinates -
.- .
Options. 5
{ 
public 

class 
HttpClientOptions "
{ 
public 
string 
BaseAddress !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ’
\C:\repos\PersonnelMapping.ProcessCoordinates\ProcessCoordinates\Options\MapsApiKeyOptions.cs
	namespace 	
PersonnelMapping
 
. 
ProcessCoordinates -
{ 
public 

class 
MapsApiKeyOptions "
{ 
public 
string 
Key 
{ 
get 
;  
set! $
;$ %
}& '
} 
} ¿
JC:\repos\PersonnelMapping.ProcessCoordinates\ProcessCoordinates\Program.cs
	namespace		 	
PersonnelMapping		
 
.		 
ProcessCoordinates		 -
{

 
public 

static 
class 
Program 
{ 
private 
static 
IConfiguration %
configuration& 3
=4 5
new6 9 
ConfigurationBuilder: N
(N O
)O P
. 
SetBasePath 
( 
	Directory "
." #
GetCurrentDirectory# 6
(6 7
)7 8
)8 9
. 
AddJsonFile 
( 
$str +
,+ ,
optional- 5
:5 6
true7 ;
); <
. 
AddJsonFile 
( 
$" 
appsettings. '
{' (
Environment( 3
.3 4"
GetEnvironmentVariable4 J
(J K
$strK c
)c d
}d e
.jsone j
"j k
,k l
optionalm u
:u v
falsew |
)| }
. 
Build 
( 
) 
; 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
Log 
. 
Logger 
= 
new 
LoggerConfiguration 0
(0 1
)1 2
. 
Enrich 
. 
FromLogContext &
(& '
)' (
. 
ReadFrom 
. 
Configuration '
(' (
configuration( 5
)5 6
. 
CreateLogger 
( 
) 
;  
try 
{ 
Log 
. 
Information 
(  
$str  -
)- .
;. /
CreateHostBuilder !
(! "
args" &
)& '
.' (
Build( -
(- .
). /
./ 0
Run0 3
(3 4
)4 5
;5 6
} 
catch 
( 
	Exception 
ex 
)  
{   
Log!! 
.!! 
Fatal!! 
(!! 
ex!! 
,!! 
$str!! ;
)!!; <
;!!< =
}"" 
finally## 
{$$ 
Log%% 
.%% 
CloseAndFlush%% !
(%%! "
)%%" #
;%%# $
}&& 
}'' 	
public)) 
static)) 
IHostBuilder)) "
CreateHostBuilder))# 4
())4 5
string))5 ;
[)); <
]))< =
args))> B
)))B C
=>))D F
Host** 
.**  
CreateDefaultBuilder** %
(**% &
args**& *
)*** +
.++ 
ConfigureLogging++ !
(++! "
logging++" )
=>++* ,
{,, 
logging-- 
.-- 
ClearProviders-- *
(--* +
)--+ ,
;--, -
logging.. 
... 

AddSerilog.. &
(..& '
)..' (
;..( )
}// 
)// 
.00 $
ConfigureWebHostDefaults00 )
(00) *

webBuilder00* 4
=>005 7
{11 

webBuilder22 
.22 

UseStartup22 )
<22) *
Startup22* 1
>221 2
(222 3
)223 4
;224 5
}33 
)33 
;33 
}44 
}55 ¸$
JC:\repos\PersonnelMapping.ProcessCoordinates\ProcessCoordinates\Startup.cs
	namespace		 	
PersonnelMapping		
 
.		 
ProcessCoordinates		 -
{

 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services 
. 
	Configure 
< 
MapsApiKeyOptions 0
>0 1
(1 2
Configuration2 ?
.? @

GetSection@ J
(J K
$strK Y
)Y Z
)Z [
;[ \
services 
. 
	Configure 
< 
HttpClientOptions 0
>0 1
(1 2
Configuration2 ?
.? @

GetSection@ J
(J K
$strK [
)[ \
)\ ]
;] ^
services 
. 
	Configure 
< 

UrlOptions )
>) *
(* +
Configuration+ 8
.8 9

GetSection9 C
(C D
$strD P
)P Q
)Q R
;R S
services 
. 
AddControllers #
(# $
)$ %
;% &
services 
. 
AddSwaggerGen "
(" #
c# $
=>% '
{ 
c 
. 

SwaggerDoc 
( 
$str !
,! "
new# &
OpenApiInfo' 2
{ 
Version   
=   
$str   "
,  " #
Title!! 
=!! 
$str!! 1
,!!1 2
Description"" 
=""  !
$str""" T
,""T U
Contact## 
=## 
new## !
OpenApiContact##" 0
{$$ 
Name%% 
=%% 
$str%% *
,%%* +
Email&& 
=&& 
string&&  &
.&&& '
Empty&&' ,
,&&, -
Url'' 
='' 
new'' !
Uri''" %
(''% &
Configuration''& 3
.''3 4

GetSection''4 >
(''> ?
$str''? S
)''S T
.''T U
Value''U Z
)''Z [
}(( 
,(( 
License)) 
=)) 
new)) !
OpenApiLicense))" 0
{** 
Name++ 
=++ 
$str++ ,
,++, -
Url,, 
=,, 
new,, !
Uri,," %
(,,% &
Configuration,,& 3
.,,3 4

GetSection,,4 >
(,,> ?
$str,,? S
),,S T
.,,T U
Value,,U Z
),,Z [
}-- 
}.. 
).. 
;.. 
}// 
)// 
;// 
}00 	
public33 
void33 
	Configure33 
(33 
IApplicationBuilder33 1
app332 5
,335 6
IWebHostEnvironment337 J
env33K N
)33N O
{44 	
app55 
.55 

UseSwagger55 
(55 
)55 
;55 
app77 
.77 
UseSwaggerUI77 
(77 
c77 
=>77 !
{88 
c99 
.99 
SwaggerEndpoint99 !
(99! "
$str99" <
,99< =
$str99> S
)99S T
;99T U
c:: 
.:: 
RoutePrefix:: 
=:: 
string::  &
.::& '
Empty::' ,
;::, -
};; 
);; 
;;; 
app== 
.== 
UseHttpsRedirection== #
(==# $
)==$ %
;==% &
app?? 
.?? 

UseRouting?? 
(?? 
)?? 
;?? 
appAA 
.AA 
UseAuthorizationAA  
(AA  !
)AA! "
;AA" #
appCC 
.CC 
UseEndpointsCC 
(CC 
	endpointsCC &
=>CC' )
{DD 
	endpointsEE 
.EE 
MapControllersEE (
(EE( )
)EE) *
;EE* +
}FF 
)FF 
;FF 
}GG 	
}HH 
}II ∆
MC:\repos\PersonnelMapping.ProcessCoordinates\ProcessCoordinates\UrlOptions.cs
	namespace 	
PersonnelMapping
 
. 
ProcessCoordinates -
{ 
public 

class 

UrlOptions 
{ 
public 
string 

CompanyUrl  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} 