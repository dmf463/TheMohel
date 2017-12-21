if(sprite_index == spr_cashMan_die)
{
	image_speed = 0;
	image_index = 18;
}
if(sprite_index == spr_CashMan_cash)
{
	horizontalSpeed = -horizontalSpeed;
	currentSprite = spr_CashMan_walk;
}
//if(sprite_index == spr_dick_flash)
//{
//	horizontalSpeed = -horizontalSpeed;
//	currentSprite = spr_dick_walk;
//}