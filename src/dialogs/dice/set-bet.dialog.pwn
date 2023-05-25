dialog SetBetDialog(playerid, response, const inputtext[]) 
{
    if (!response) return 1;

    new tableId = PlayerEnteredTableId[playerid];
    if (tableId == -1) return 0;

    new newBet = strval(inputtext);
    if (newBet < MIN_DICE_BET || newBet > MAX_DICE_BET) 
    {
        SendClientMessage(playerid, COLOR_GREY, !"������� �������� �����!");
        return Dialog_Show(playerid, !"TemplateOfSetBetDialog");
    }

    // �������� �� ������, ���� �� ������ ������ ������ � ������ ���-�� �� ������� �������� ������
    if (DiceTableInfo[tableId][dtPlayersCount] > 0) return SendClientMessage(playerid, COLOR_GREY, !"���-�� ��� �������� ������. ���������, ����� �� � ����.");

    DiceTableInfo[tableId][dtBet] = newBet;
    UpdateDiceTableTextDraws(tableId, UPDATE_TYPE_BET);
    UpdateDiceTable3DText(tableId);

    return 1;
}

dtempl TemplateOfSetBetDialog(playerid)
{
    return Dialog_Open(playerid, 
        dfunc: SetBetDialog, 
        DIALOG_STYLE_INPUT,
        !"{FFFFFF}����� | {BC2C2C}������", 
        !"{FFFFFF}������� ������. ����������� ������: {BC2C2C}"MIN_DICE_BET_STR"$, {FFFFFF}������������ - {BC2C2C}"MAX_DICE_BET_STR"$", 
        !"�������", 
        !"��������"
    );
}