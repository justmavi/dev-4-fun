CMD:setdealer(playerid, const params[]) 
{
	if (!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_GREY, !"��� ���������� ��� �������!");
	extract params -> new player: targetId; else return SendClientMessage(playerid, -1, !"�������: /setdealer [id]");

	if (!IsPlayerConnected(targetId)) return SendClientMessage(playerid, COLOR_GREY, !"������ ��� � ����");

	PlayerData[targetId][pDiller] = !PlayerData[targetId][pDiller];

	SendClientMessage(playerid, COLOR_GREEN, !"��������� ���������");
	return 1;
}