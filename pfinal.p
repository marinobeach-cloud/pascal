{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
program practicafinal;

uses Classes,SysUtils;

type
    tipoarray= array[1..40,1..40] of string;
    tipoarray2=array[1..10] of string;
    tipoarray3=array of array of string;
    tipocfigura=(rectangulo,linea,punto,error);
    tiposentido=(horizontal,vertical);
    tipocoordenada=record
        fila:integer;
        columna:integer;
    end;
    tipolinea=record
        coor:tipocoordenada;
        long:integer;
        sentido:tiposentido;
    end;
    tiporect=record
        cor1:tipocoordenada;
        cor2:tipocoordenada;
    end;
    tipopunto=record
        fila:integer;
        columna:integer;
    end;
    tipofigura=record
        clase:tipocfigura;
        simbolo:string;
        punt:tipopunto;
        rect:tiporect;
        lin:tipolinea;
    end;
    
    
procedure iniciartablero(var tablero:tipoarray; var simbolotab:string);
var 
    i:integer;
    f:integer;
begin
    for i:=1 to 20 do begin
        for f:=1 to 40 do begin
            tablero[i,f]:=simbolotab;
        end;
    end;
end;   

procedure iniciartablero2(var tablero:tipoarray3; var simbolotab:string;var linea,columna:integer);
var 
    i:integer;
    f:integer;
begin
    for i:=1 to linea do begin
        for f:=1 to columna do begin
            tablero[i,f]:=simbolotab;
        end;
    end;
end; 
      
procedure pintartablero(var tablero:tipoarray);
var
    i:integer;
    f:integer;        
begin
    for i:=1 to 20 do begin
        for f:=1 to 40 do begin
           Write(tablero[i,f]);     
        end;
        Writeln();
    end;
    Writeln();
end;

procedure pintartablero2(var tablero:tipoarray3;var linea,columna:integer);
var
    i:integer;
    f:integer;        
begin
    for i:=1 to linea do begin
        for f:=1 to columna do begin
           Write(tablero[i,f]);     
        end;
        Writeln();
    end;
    Writeln();
end;

function transfig(t:string):tipocfigura;
begin
    if t='rectangulo' then begin
        result:=rectangulo;
    end
    else if t='linea' then begin
        result:=linea;
    end
    else if t='punto' then begin
        result:=punto;
    end
    else begin  
        result:=error;  
    end;
end;

function darvuelta(var figuras:tipoarray2;var size:integer):tipoarray2;    
begin
    if size=2 then begin
        result:=figuras;
    end
    else if size=3 then begin
        result[1]:=figuras[2];
        result[2]:=figuras[1];
    end
    else if size=4 then begin
        result[1]:=figuras[3];
        result[2]:=figuras[2];
        result[3]:=figuras[1];      
    end
    else if size=5 then begin
        result[1]:=figuras[4];
        result[2]:=figuras[3];
        result[3]:=figuras[2];
        result[4]:=figuras[1];     
    end  
    else if size=6 then begin
        result[1]:=figuras[5];
        result[2]:=figuras[4];
        result[3]:=figuras[3];
        result[4]:=figuras[2];
        result[5]:=figuras[1];    
    end
    else if size=8 then begin
        result[1]:=figuras[7];
        result[2]:=figuras[6];
        result[3]:=figuras[5];
        result[4]:=figuras[4];
        result[5]:=figuras[3];
        result[6]:=figuras[2];
        result[7]:=figuras[1];   
    end
    else if size=9 then begin
        result[1]:=figuras[8];
        result[2]:=figuras[7];
        result[3]:=figuras[6];
        result[4]:=figuras[5];
        result[5]:=figuras[4];
        result[6]:=figuras[3];
        result[7]:=figuras[2];
        result[8]:=figuras[1];   
    end
    else if size=10 then begin
        result[1]:=figuras[9];
        result[2]:=figuras[8];
        result[3]:=figuras[7];
        result[4]:=figuras[6];
        result[5]:=figuras[5];
        result[6]:=figuras[4];
        result[7]:=figuras[3];
        result[8]:=figuras[2];
        result[9]:=figuras[1];
           
    end
    else if size=11 then begin
        result[1]:=figuras[10];
        result[2]:=figuras[9];
        result[3]:=figuras[8];
        result[4]:=figuras[7];
        result[5]:=figuras[6];
        result[6]:=figuras[5]; 
        result[7]:=figuras[4];
        result[8]:=figuras[3];
        result[9]:=figuras[2]; 
        result[10]:=figuras[1]; 
    end;
end;

procedure pintarfig(var linea:string;var tablero:tipoarray);
var
    sl:TStringList;
    i:integer;
    f:integer;
    max:integer;
begin   
        sl:=TStringList.Create;
        sl.Delimiter:=' ';    
        sl.DelimitedText:=linea;
        if (sl[0]='rectangulo') then begin
            for i:=StrToInt(sl[2]) to StrToInt(sl[4]) do begin
                for f:=StrToInt(sl[3]) to StrToInt(sl[5]) do begin
                    tablero[i,f]:=sl[1];
                end;
            end;
            pintartablero(tablero);
        end
        else if (sl[0]='punto') then begin
            i:=StrToInt(sl[2]);
            f:=StrToInt(sl[3]);
            tablero[i,f]:=sl[1];
            pintartablero(tablero);
        end
        else if (sl[0]='linea') then begin
            i:=StrToInt(sl[3]);
            f:=StrToInt(sl[4]);
            if sl[2]='horizontal' then begin
                max:=f+StrToInt(sl[5]);
                for f:=f to max-1 do begin
                    tablero[i,f]:=sl[1];
                end;
            end
            else if sl[2]='vertical' then begin
                max:=i+StrToInt(sl[5]);
                for i:=i to max-1 do begin
                    tablero[i,f]:=sl[1];
                end;
            end;
            pintartablero(tablero);
        end;
end;

procedure pintarfig2(var linea:string;var tablero:tipoarray3;var fila,columna:integer);
var
    sl:TStringList;
    i:integer;
    f:integer;
    max:integer;
begin   
        sl:=TStringList.Create;
        sl.Delimiter:=' ';    
        sl.DelimitedText:=linea;
        if (sl[0]='rectangulo') then begin
            for i:=StrToInt(sl[2]) to StrToInt(sl[4]) do begin
                for f:=StrToInt(sl[3]) to StrToInt(sl[5]) do begin
                    tablero[i,f]:=sl[1];
                end;
            end;
            pintartablero2(tablero,fila,columna);
        end
        else if (sl[0]='punto') then begin
            i:=StrToInt(sl[2]);
            f:=StrToInt(sl[3]);
            tablero[i,f]:=sl[1];
            pintartablero2(tablero,fila,columna);
        end
        else if (sl[0]='linea') then begin
            i:=StrToInt(sl[3]);
            f:=StrToInt(sl[4]);
            if sl[2]='horizontal' then begin
                max:=f+StrToInt(sl[5]);
                for f:=f to max-1 do begin
                    tablero[i,f]:=sl[1];
                end;
            end
            else if sl[2]='vertical' then begin
                max:=i+StrToInt(sl[5]);
                for i:=i to max-1 do begin
                    tablero[i,f]:=sl[1];
                end;
            end;
            pintartablero2(tablero,fila,columna);
        end;
end;

function existfig(var figura:string;var linea:integer;var columna:integer):string;
var
    i:integer;
    sl:TStringList;
    f:integer;
    max:integer;
    
begin
    sl:=TStringList.Create;
    sl.Delimiter:=' ';    
    sl.DelimitedText:=figura;
    result:='false';
    if (sl[0]='rectangulo') then begin
        for i:=StrToInt(sl[2]) to StrToInt(sl[4]) do begin
            for f:=StrToInt(sl[3]) to StrToInt(sl[5]) do begin
                if (i=linea) and (f=columna) then begin
                   result:='true'; 
                end;
            end;
        end;
    end
    else if (sl[0]='punto') then begin
        if (StrToInt(sl[2])=linea) and (StrToInt(sl[3])=columna) then begin
            result:='true';
        end;
    end
    else if (sl[0]='linea') then begin
        i:=StrToInt(sl[3]);
        f:=StrToInt(sl[4]);
        if sl[2]='horizontal' then begin
            max:=f+StrToInt(sl[5]);
            for f:=f to max-1 do begin
                if (i=linea) and (f=columna) then begin
                    result:='true';
                end;
            end;
        end
        else if sl[2]='vertical' then begin
            max:=i+StrToInt(sl[5]);
            for i:=i to max-1 do begin
                if (i=linea) and (f=columna) then begin
                    result:='true';
                end;
            end;
        end;
    end;   
end;

function moverfig(var figura:string;var linea:integer;var columna:integer):string;
var
    i:integer;
    sl:TStringList;
    f:integer;
    g,h:integer;
    
    
begin
    sl:=TStringList.Create;
    sl.Delimiter:=' ';    
    sl.DelimitedText:=figura;
    result:='false';
    if (sl[0]='rectangulo') then begin
        i:=StrToInt(sl[2])+linea;
        f:=StrToInt(sl[3])+columna;
        g:=StrToInt(sl[4])+linea;
        h:=StrToInt(sl[5])+columna;
        result:=concat('rectangulo',' ',sl[1],' ',IntToStr(i),' ',IntToStr(f),' ',IntToStr(g),' ',IntToStr(h));
    end
    else if (sl[0]='punto') then begin
        i:=StrToInt(sl[2])+linea;
        f:=StrToInt(sl[3])+columna;
        result:=concat('punto',' ',sl[1],' ',IntToStr(i),' ',IntToStr(f));
    end
    else if (sl[0]='linea') then begin
        i:=StrToInt(sl[3])+linea;
        f:=StrToInt(sl[4])+columna;
        result:=concat('linea',' ',sl[1],' ',sl[2],' ',IntToStr(i),' ',IntToStr(f),' ',sl[5]);
    end;
end;

procedure leerarchivo(var tablero:tipoarray;var simbolotab:string);
var
    salida: text;
    linea:string;
    sl:TStringList;
    figura:tipofigura;
    i:integer;
    f:integer;
    max:integer;
    figuras:array[1..10] of string;
    size:integer;
    a:string;
    fila,columna,fila2,columna2:integer;
    tipoarray3: array of array of string;

begin
    assign(salida, 'datos.txt');    
    reset(salida);
    setlength(tipoarray3,100,100);
    size:=1;
    while not eof(salida) do
    begin   
        readln(salida, linea);
        sl:=TStringList.Create;
        sl.Delimiter:=' ';    
        sl.DelimitedText:=linea;
        if (sl[0]='rectangulo') then begin
            figuras[size]:=linea;
            figura.simbolo:=sl[1];
            for i:=StrToInt(sl[2]) to StrToInt(sl[4]) do begin
                for f:=StrToInt(sl[3]) to StrToInt(sl[5]) do begin
                    tablero[i,f]:=figura.simbolo;
                end;
            end;
            pintartablero(tablero);
            size:=size+1;
        end
        else if (sl[0]='punto') then begin
            figuras[size]:=linea;
            figura.simbolo:=sl[1];
            i:=StrToInt(sl[2]);
            f:=StrToInt(sl[3]);
            tablero[i,f]:=figura.simbolo;
            size:=size+1;
            pintartablero(tablero);
        end
        else if (sl[0]='linea') then begin
            figuras[size]:=linea;
            size:=size+1;
            figura.simbolo:=sl[1];
            i:=StrToInt(sl[3]);
            f:=StrToInt(sl[4]);
            if sl[2]='horizontal' then begin
                max:=f+StrToInt(sl[5]);
                for f:=f to max-1 do begin
                    tablero[i,f]:=figura.simbolo;
                end;
            end
            else if sl[2]='vertical' then begin
                max:=i+StrToInt(sl[5]);
                for i:=i to max-1 do begin
                    tablero[i,f]:=figura.simbolo;
                end;
            end;
            pintartablero(tablero);
        end
        else if (sl[0]='papel') then begin
            figura.simbolo:=sl[1];
            for i:=1 to 20 do begin
                for f:=1 to 40 do begin
                    if tablero[i,f]=simbolotab then begin
                        tablero[i,f]:=figura.simbolo;
                    end;
                end;
            end;
            pintartablero(tablero);
            simbolotab:=figura.simbolo;
        end
        else if(sl[0]='alreves') then begin
            figuras:=darvuelta(figuras,size);
            iniciartablero(tablero,simbolotab);
            for i:=1 to size-1 do begin
                pintarfig(figuras[i],tablero);
            end;                
        end
        else if (sl[0]='borrar') then begin
            fila:=StrToInt(sl[1]);
            columna:=StrToInt(sl[2]);
            for i:=1 to size-1 do begin                
                a:=existfig(figuras[i],fila,columna);
                if a='true' then begin 
                    if i=10 then begin
                        figuras[i]:='';
                    end
                    else begin
                        figuras[i]:=figuras[i+1];
                    end;
                    break;    
                end;              
            end;
            iniciartablero(tablero,simbolotab);
            for i:=1 to size-1 do begin
                pintarfig(figuras[i],tablero);
            end;
            if a='true' then begin
                size:=size-1;
            end;
        end
        else if (sl[0]='mover') then begin
            fila:=StrToInt(sl[1]);
            columna:=StrToInt(sl[2]);
            fila2:=StrToInt(sl[4]);
            columna2:=StrToInt(sl[3]);
            for i:=1 to size-1 do begin                
                a:=existfig(figuras[i],fila,columna);
                if a='true' then begin
                    figuras[i]:=moverfig(figuras[i],fila2,columna2);
                    Writeln(figuras[i]);
                    break;
                end;
            end;
            iniciartablero(tablero,simbolotab);
            for i:=1 to size-1 do begin
                pintarfig(figuras[i],tablero);
            end;
        end
        else if (sl[0]='pantalla') then begin
            fila:=StrToInt(sl[1]);
            columna:=StrToInt(sl[2]);
            setlength(tipoarray3,fila,columna);
            iniciartablero2(tipoarray3,simbolotab,fila,columna);
            for i:=1 to size-1 do begin
                pintarfig2(figuras[i],tipoarray3,fila,columna);
            end;
        end;
    end;        
    close(salida);
end;


var
tablero:tipoarray;
simbolotab:string='.';

begin
    iniciartablero(tablero,simbolotab);
    pintartablero(tablero);
    leerarchivo(tablero,simbolotab);
end.
