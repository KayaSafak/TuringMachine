Library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
Entity eProje is
port(giris : in std_logic_vector(7 downto 0);
cikis : out std_logic_vector(2 downto 0));
end eProje;
Architecture behv of eProje is
procedure eParity(signal a : in std_logic_vector(7 downto 0);
signal f2 : out std_logic) is
begin
f2 <=a(7)xor a(6) xor a(5) xor a(4) xor a(3) xor a(2) xor a(1) xor a(0); -- sonuc 0 ise 1 ler sayisi cift
end eParity;
procedure eMod(signal a : in std_logic_vector(7 downto 0);
signal f1 : out std_logic) is
variable k : integer;
begin
k := conv_integer(a(7))*2 + conv_integer(a(6));
if (k > 2) then
k := k-3;
end if;
k := k*2 + conv_integer(a(5));
if (k > 2) then
k := k-3;
end if;
k := k*2+conv_integer(a(4));
if (k >2) then
k := k-3;
end if;
k := k*2+conv_integer(a(3));
if (k >2) then
k:=k-3;
end if;
k := k*2+conv_integer(a(2));
if (k >2) then
k:=k-3;
end if;
k := k*2+conv_integer(a(1));
if (k >2) then
k:=k-3;
end if;
k := k*2+conv_integer(a(0));
if (k >2) then
k := k-3;
end if;
if(k = 0) then
f1 <= '1';
elsif(k = 1) then
f1 <='0';
elsif(k = 2) then
f1<= '0';
end if;
end eMod;
procedure ePoli(signal a : in std_logic_vector(7 downto 0);
signal f0 : out std_logic) is
variable s : integer; --counter
begin
s:= 0;
if(a(7)=a(0)) then
s := s+1;
end if;
if(a(6)=a(1)) then
s := s+1;
end if;
if(a(5)=a(2)) then
s := s+1;
end if;
if(a(4)=a(3)) then
s := s+1;
end if;
if(s>3) then
f0<='1';
end if;
if(s<4) then
f0<='0';
end if;
end ePoli;
Begin
eParity(giris,cikis(2));
eMod(giris,cikis(1));
ePoli(giris,cikis(0));
end behv;
