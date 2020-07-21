º4
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
>  % &
Get  ' *
(  * +
string  + 1
streetAddress  2 ?
,  ? @
string  A G
	stateCode  H Q
)  Q R
{!! 	
await"" 
ProcessAddress""  
(""  !
streetAddress""! .
,"". /
	stateCode""0 9
)""9 :
;"": ;
return## 
_address## 
.## 
Coordinates## '
;##' (
}$$ 	
[&& 	
HttpGet&&	 
]&& 
public'' 
string'' 
GetMapApiKey'' "
(''" #
)''# $
{(( 	
return)) 
_mapsApiKey)) 
;)) 
}** 	
private,, 
async,, 
Task,, 
ProcessAddress,, )
(,,) *
string,,* 0
address,,1 8
,,,8 9
string,,: @
	stateCode,,A J
),,J K
{-- 	
if.. 
(.. 
string.. 
... 
IsNullOrEmpty.. $
(..$ %
	stateCode..% .
)... /
)../ 0
{// 
_logger00 
.00 
LogInformation00 &
(00& '
$str00' D
)00D E
;00E F
}11 
else22 
{33 
var44 
convertedAddress44 $
=44% &
new44' *
Address44+ 2
{443 4
State445 :
=44; <
	stateCode44= F
,44F G
Street44H N
=44O P
address44Q X
}44Y Z
;44Z [
await55 $
UpdateAddressCoordinates55 .
(55. /
convertedAddress55/ ?
)55? @
;55@ A
}66 
}77 	
private99 
async99 
Task99 $
UpdateAddressCoordinates99 3
(993 4
Address994 ;
address99< C
)99C D
{:: 	
_logger;; 
.;; 
LogInformation;; "
(;;" #
$";;# %$
Loading coordinates for ;;% =
{;;= >
address;;> E
.;;E F
FullAddress;;F Q
};;Q R
";;R S
);;S T
;;;T U
var<< 
result<< 
=<< 
await<< 
_client<< &
.<<& '
GetAsync<<' /
(<</ 0
GetUrl<<0 6
(<<6 7
address<<7 >
.<<> ?
FullAddress<<? J
)<<J K
)<<K L
;<<L M
if>> 
(>> 
!>> 
result>> 
.>> 
IsSuccessStatusCode>> +
)>>+ ,
{?? 
_address@@ 
.@@ 
Coordinates@@ $
=@@% &
new@@' *
Coordinates@@+ 6
(@@6 7
)@@7 8
;@@8 9
}AA 
varBB 
responseBB 
=BB 
awaitBB  
resultBB! '
.BB' (
ContentBB( /
.BB/ 0
ReadAsStringAsyncBB0 A
(BBA B
)BBB C
;BBC D
varCC 
coordinatesCC 
=CC 
JsonConvertCC )
.CC) *
DeserializeObjectCC* ;
<CC; <

RootObjectCC< F
>CCF G
(CCG H
responseCCH P
)CCP Q
.CCQ R
FeaturesCCR Z
[CCZ [
$numCC[ \
]CC\ ]
.CC] ^
GeometryCC^ f
.CCf g
CoordinatesCCg r
;CCr s
addressDD 
.DD 
CoordinatesDD 
=DD  !
newDD" %
CoordinatesDD& 1
{DD2 3
	LongitudeDD4 =
=DD> ?
coordinatesDD@ K
[DDK L
$numDDL M
]DDM N
,DDN O
LatitudeDDP X
=DDY Z
coordinatesDD[ f
[DDf g
$numDDg h
]DDh i
}DDj k
;DDk l
_addressFF 
=FF 
addressFF 
;FF 
}GG 	
privateII 
stringII 
GetUrlII 
(II 
stringII $
fullAddressII% 0
)II0 1
{JJ 	
varKK 
urlKK 
=KK 
$"KK >
2https://api.mapbox.com/geocoding/v5/mapbox.places/KK J
"KKJ K
+KKL M
$"LL 
{LL 
fullAddressLL &
}LL& '
.json?access_token=LL' :
{LL: ;
_mapsApiKeyLL; F
}LLF G
"LLG H
;LLH I
returnMM 
urlMM 
;MM 
}NN 	
}PP 
}QQ ‡
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
} ¨
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

class 
Program 
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
}55 ï'
JC:\repos\PersonnelMapping.ProcessCoordinates\ProcessCoordinates\Startup.cs
	namespace

 	
PersonnelMapping


 
.

 
ProcessCoordinates

 -
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services 
. 
	Configure 
< 
MapsApiKeyOptions 0
>0 1
(1 2
Configuration2 ?
.? @

GetSection@ J
(J K
$strK Y
)Y Z
)Z [
;[ \
services 
. 
	Configure 
< 
HttpClientOptions 0
>0 1
(1 2
Configuration2 ?
.? @

GetSection@ J
(J K
$strK [
)[ \
)\ ]
;] ^
services 
. 
	Configure 
< 

UrlOptions )
>) *
(* +
Configuration+ 8
.8 9

GetSection9 C
(C D
$strD P
)P Q
)Q R
;R S
services 
. 
AddControllers #
(# $
)$ %
;% &
services 
. 
AddSwaggerGen "
(" #
c# $
=>% '
{ 
c 
. 

SwaggerDoc 
( 
$str !
,! "
new# &
OpenApiInfo' 2
{   
Version!! 
=!! 
$str!! "
,!!" #
Title"" 
="" 
$str"" 1
,""1 2
Description## 
=##  !
$str##" T
,##T U
Contact$$ 
=$$ 
new$$ !
OpenApiContact$$" 0
{%% 
Name&& 
=&& 
$str&& *
,&&* +
Email'' 
='' 
string''  &
.''& '
Empty''' ,
,'', -
Url(( 
=(( 
new(( !
Uri((" %
(((% &
Configuration((& 3
.((3 4

GetSection((4 >
(((> ?
$str((? S
)((S T
.((T U
Value((U Z
)((Z [
})) 
,)) 
License** 
=** 
new** !
OpenApiLicense**" 0
{++ 
Name,, 
=,, 
$str,, ,
,,,, -
Url-- 
=-- 
new-- !
Uri--" %
(--% &
Configuration--& 3
.--3 4

GetSection--4 >
(--> ?
$str--? S
)--S T
.--T U
Value--U Z
)--Z [
}.. 
}// 
)// 
;// 
}00 
)00 
;00 
}11 	
public44 
void44 
	Configure44 
(44 
IApplicationBuilder44 1
app442 5
,445 6
IWebHostEnvironment447 J
env44K N
)44N O
{55 	
app66 
.66 

UseSwagger66 
(66 
)66 
;66 
app88 
.88 
UseSwaggerUI88 
(88 
c88 
=>88 !
{99 
c:: 
.:: 
SwaggerEndpoint:: !
(::! "
$str::" <
,::< =
$str::> S
)::S T
;::T U
c;; 
.;; 
RoutePrefix;; 
=;; 
string;;  &
.;;& '
Empty;;' ,
;;;, -
}<< 
)<< 
;<< 
if>> 
(>> 
env>> 
.>> 
IsDevelopment>> !
(>>! "
)>>" #
)>># $
{?? 
app@@ 
.@@ %
UseDeveloperExceptionPage@@ -
(@@- .
)@@. /
;@@/ 0
}AA 
appCC 
.CC 
UseHttpsRedirectionCC #
(CC# $
)CC$ %
;CC% &
appEE 
.EE 

UseRoutingEE 
(EE 
)EE 
;EE 
appGG 
.GG 
UseAuthorizationGG  
(GG  !
)GG! "
;GG" #
appII 
.II 
UseEndpointsII 
(II 
	endpointsII &
=>II' )
{JJ 
	endpointsKK 
.KK 
MapControllersKK (
(KK( )
)KK) *
;KK* +
}LL 
)LL 
;LL 
}MM 	
}NN 
}OO ∆
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