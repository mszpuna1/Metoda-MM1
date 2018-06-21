function x=pelny_gauss(M,v) %dane wejœciowe: macierz M i wektor rozwi¹zañ v

n=size(v,1); %Wyznaczenie liczby wierszy i kolumn w M
temp=zeros(n,1); %tablica pomocnicza [1;2;...;n] pamiêtaj¹ca zamiany wierszy v
for i=1:n
    temp(i,1)=i;
end

x=zeros(n,1);

for i=1:n
    %etap wyboru argumentu g³ównego
    [row,rowid]=max(abs(M(i:n, i:n))); %szukanie wiersza argumentu w podmacierzy i x i
    [maxvalue, kolumnid]=max(row); %szukanie kolumny argumentu w podmacierzy i x i
    rowid=rowid(kolumnid)+i-1; %prawdziwa wartoœæ znalezionego wiersza w macierzy M
    kolumnid=kolumnid+i-1; %prawdziwa wartoœæ znalezionej kolumny w M
    
    v([i,rowid],1)=v([rowid,i],1); %zamiana wierszy w wektorze v
    M([i, rowid],:)=M([rowid,i],:); %zamiana wierszy w macierzy M
    M(:,[i, kolumnid])=M(:,[kolumnid, i]); %zamiana kolumn w macierzy M
    
    temp([i,kolumnid],1)=temp([kolumnid,i],1); %zamiana wierszy w tablicy pomocniczej
    
    
    %etap eliminacji 
    for j=i+1:n
        c=M(j,i)/M(i,i);
        M(j, i+1:n)=M(j, i+1:n)-(M(i, i+1:n)*c); %macierz U 
        v(j,1)=v(j,1)-(v(i,1)*c); %przeksztalcenie v
    end
end

for i=n:-1:1%rozwi¹zywanie uk³adu równañ w macierzy trójk¹tnej
    c=1/M(i,i);
    x(i,1)=(v(i,1)-M(i,i+1:n)*x(i+1:n,1))*c;
end
x(temp,:)=x;%uporz¹dkowanie wektora x
end
    
    
    
    