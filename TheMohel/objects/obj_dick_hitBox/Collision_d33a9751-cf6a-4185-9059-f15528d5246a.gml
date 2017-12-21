with(obj_player)
{
	if(!gameOver)
	{
		playerHit = true;
		Frustration += 1;
		moveSpeed -= 1;
		walkSpeed -= 1;
	}
}
with(obj_dickPicsRecieved)
{
	pics += 1;
}
instance_destroy();