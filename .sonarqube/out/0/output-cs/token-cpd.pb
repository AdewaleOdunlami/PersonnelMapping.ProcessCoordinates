�4
gC:\repos\PersonnelMapping.ProcessCoordinates\ProcessCoordinates\Controllers\ProcessAddressController.cs
	namespace 	
PersonnelMapping
 
. 
ProcessCoordinates -
.- .
Controllers. 9
{ 
[

]
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

,  ? @
string  A G
	stateCode  H Q
)  Q R
{!! 	
await"" 
ProcessAddress""  
(""  !

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

(..$ %
	stateCode..% .
)... /
)../ 0
{// 
_logger00 
.00 
LogInformation00 &
(00& '
$str00' D
)00D E
;00E F
}11 
else22 
{33 
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
}66 
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
{?? 
_address@@ 
.@@ 
Coordinates@@ $
=@@% &
new@@' *
Coordinates@@+ 6
(@@6 7
)@@7 8
;@@8 9
}AA 
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
}QQ �
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

.4 5
ManagedThreadId5 D
)D E
)E F
;F G
}
} 
} �
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
State
=
$str
;
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
{"" 
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
}$$ 
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
}(( �
QC:\repos\PersonnelMapping.ProcessCoordinates\ProcessCoordinates\Models\Context.cs
	namespace 	
PersonnelMapping
 
. 
ProcessCoordinates -
.- .
Models. 4
{ 
public 

class 
Context 
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
Text 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Wikidata 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
string		 

Short_Code		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
}

 
} �
UC:\repos\PersonnelMapping.ProcessCoordinates\ProcessCoordinates\Models\Coordinates.cs
	namespace 	
PersonnelMapping
 
. 
ProcessCoordinates -
.- .
Models. 4
{ 
public 

class 
Coordinates 
{ 
public 
Coordinates 
( 
) 
{ 	
	Longitude 
= 
$num 
; 
Latitude		 
=		 
$num		 
;		 
}

 	
public 
double 
	Longitude 
{  !
get" %
;% &
set' *
;* +
}, -
public
double
Latitude
{
get
;
set
;
}
} 
} �
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

=>		" $
!		% &
string		& ,
.		, -

(		: ;
	RequestId		; D
)		D E
;		E F
}

 
} �
QC:\repos\PersonnelMapping.ProcessCoordinates\ProcessCoordinates\Models\Feature.cs
	namespace 	
PersonnelMapping
 
. 
ProcessCoordinates -
.- .
Models. 4
{ 
public 

class 
Feature 
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public		 
string		 
Type		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
List

 
<

 
string

 
>

 

Place_Type

 &
{

' (
get

) ,
;

, -
set

. 1
;

1 2
}

3 4
public 
double 
	Relevance 
{  !
get" %
;% &
set' *
;* +
}, -
public 

Properties 

Properties $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public
string
Text
{
get
;
set
;
}
public 
string 

Place_Name  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
List 
< 
double 
> 
Center "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
Geometry 
Geometry  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
public 
List 
< 
Context 
> 
Context $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
List 
< 
double 
? 
> 
Bbox !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} �
WC:\repos\PersonnelMapping.ProcessCoordinates\ProcessCoordinates\Models\GeocodePoints.cs
	namespace 	
PersonnelMapping
 
. 
ProcessCoordinates -
.- .
Models. 4
{ 
public 

class 

{ 
public 
string 
Type 
{ 
get  
;  !
set" %
;% &
}' (
public 
Coordinates 
Coordinates &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
} 
}		 �
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
 �
TC:\repos\PersonnelMapping.ProcessCoordinates\ProcessCoordinates\Models\Properties.cs
	namespace 	
PersonnelMapping
 
. 
ProcessCoordinates -
.- .
Models. 4
{ 
public 

class 

Properties 
{ 
public 
string 
Accuracy 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 

Short_Code  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Wikidata 
{  
get! $
;$ %
set& )
;) *
}+ ,
}		 
}

 �
TC:\repos\PersonnelMapping.ProcessCoordinates\ProcessCoordinates\Models\RootObject.cs
	namespace 	
PersonnelMapping
 
. 
ProcessCoordinates -
.- .
Models. 4
{ 
public 

class 

RootObject 
{ 
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
>		 
Query		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
public

 
List

 
<

 
Feature

 
>

 
Features

 %
{

& '
get

( +
;

+ ,
set

- 0
;

0 1
}

2 3
public 
string 
Attribution !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
}
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
} �
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
} �
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
private
static
IConfiguration

=
new
ConfigurationBuilder
(
)
. 
SetBasePath
( 
	Directory "
." #
GetCurrentDirectory# 6
(6 7
)7 8
)8 9
. 
AddJsonFile
( 
$str +
,+ ,
optional- 5
:5 6
true7 ;
); <
. 
AddJsonFile
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
. 
Build
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

(' (

)5 6
. 
CreateLogger 
( 
) 
;  
try 
{ 
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
} 
catch 
( 
	Exception 
ex 
)  
{   
Log!! 
.!! 
Fatal!! 
(!! 
ex!! 
,!! 
$str!! ;
)!!; <
;!!< =
}"" 
finally## 
{$$ 
Log%% 
.%% 

(%%! "
)%%" #
;%%# $
}&& 
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
}55 �#
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
{
public 
Startup 
( 
IConfiguration %

)3 4
{ 	

= 

;) *
} 	
public 
IConfiguration 

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

.? @

GetSection@ J
(J K
$strK [
)[ \
)\ ]
;] ^
services 
. 
AddControllers #
(# $
)$ %
;% &
services 
. 

(" #
c# $
=>% '
{ 
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
(''% &
$str''& @
)''@ A
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
(,,% &
$str,,& ;
),,; <
}-- 
}.. 
).. 
;.. 
}// 
)//
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
{88 
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
};; 
);;
;;; 
if== 
(== 
env== 
.== 

(==! "
)==" #
)==# $
{>> 
app?? 
.?? %
UseDeveloperExceptionPage?? -
(??- .
)??. /
;??/ 0
}@@ 
appBB 
.BB 
UseHttpsRedirectionBB #
(BB# $
)BB$ %
;BB% &
appDD 
.DD 

UseRoutingDD 
(DD 
)DD 
;DD 
appFF 
.FF 
UseAuthorizationFF  
(FF  !
)FF! "
;FF" #
appHH 
.HH 
UseEndpointsHH 
(HH 
	endpointsHH &
=>HH' )
{II 
	endpointsJJ 
.JJ 
MapControllersJJ (
(JJ( )
)JJ) *
;JJ* +
}KK 
)KK
;KK 
}LL 	
}MM 
}NN 