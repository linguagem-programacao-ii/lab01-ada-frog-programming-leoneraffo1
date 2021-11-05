with    Ada.Strings.Fixed, Ada.Text_IO, Ada.Integer_Text_IO;
use     Ada.Strings.Fixed, Ada.Text_IO, Ada.Integer_Text_IO;

procedure frogGame is
    -- Variaveis
    ultimoIdc : Natural;
    idcSplit : Integer;
    forcaPulo : Integer;
    nPipes : Integer;
    pipeAtual : Integer;
    puloAtual : Integer;
    String_Buffer : String(1..300) := (others => ' ');
    Sep : String := " ";

    procedure Split(Source : in String; Pos: in Integer; Value : out Integer; Remainder: out String) is
        Tmp : String(1..Source'Last);
    begin
        if Pos = Source'Last then Move(Source, Tmp);
        else Move(Source(Source'First .. Pos-1), Tmp); 
            Move(Source(Pos+1 .. Source'Last), Remainder);
        end if;
        Value := Integer'Value(Tmp);
    end Split;
begin
    --ler 1 linha
    Get_Line(Item => String_Buffer, Last => ultimoIdc);
    idcSplit := Index(Source => String_Buffer, Pattern => Sep, From => 1);

    Split(Source => String_Buffer, Pos => idcSplit, Value => forcaPulo, Remainder => String_Buffer);
    Split(Source => String_Buffer, Pos => String_Buffer'Last, Value => nPipes, Remainder => String_Buffer);

    --ler 2 linha
    Get_Line(Item => String_Buffer, Last => ultimoIdc);
    
    for I in 1 .. nPipes loop

        idcSplit := Index(Source => String_Buffer, Pattern => Sep, From => 1);
        Split(Source => String_Buffer, Pos => idcSplit, Value => puloAtual, Remainder => String_Buffer);
        
        if I /= 1 and abs(puloAtual - pipeAtual) > forcaPulo then
            Put_Line("GAME OVER");
            exit;
        end if;

        pipeAtual := puloAtual;

        if I = nPipes then
            Put_Line("YOU WIN");
        end if;

    end loop;
end frogGame;