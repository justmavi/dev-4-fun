CMD:givemoney(playerid, const params[])
{
	if (!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_GREY, !"��� ���������� ��� �������!");
	extract params -> new player: targetId, money; else return SendClientMessage(playerid, -1, !"�������: /givemoney [id] [�����]");

	if (!IsPlayerConnected(targetId)) return SendClientMessage(playerid, COLOR_GREY, !"������ ��� � ����");

	SetPlayerMoney(targetId, money);

	SendClientMessage(playerid, COLOR_GREEN, !"����� ��������� �� ���� ������");
	return 1;
}