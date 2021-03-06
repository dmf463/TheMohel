
if(hp > 0)
{
	//dick Movement
	verticalSpeed = verticalSpeed + grv; //in GM, the higher the number, the lower you are.

	//horizontal collision
	if(place_meeting(x + horizontalSpeed, y, obj_wall)) //place_meeting checks if there WILL be a collision
	{
		while(!place_meeting(x + sign(horizontalSpeed), y, obj_wall)) //sign returns 1 or -1 depending on whether the variable we pass is positive or negative
		{
			x = x + sign(horizontalSpeed); //make it so we can actually hit the wall
		}
		horizontalSpeed = -horizontalSpeed;
	}
	x = x + horizontalSpeed;



	//vertical collision
	if(place_meeting(x, y + verticalSpeed, obj_wall)) //place_meeting checks if there WILL be a collision
	{
		while(!place_meeting(x, y + sign(verticalSpeed), obj_wall)) //sign returns 1 or -1 depending on whether the variable we pass is positive or negative
		{
			y = y + sign(verticalSpeed); //make it so we can actually hit the wall
		}
		verticalSpeed = 0;
	}
	y = y + verticalSpeed;

	//Animations: currentSprite and previousSprites are just holders
	if(currentSprite != spr_CashMan_cash) && (instance_exists(hitBox))
	{
		instance_destroy(hitBox);
	}
	if(!place_meeting(x, y + 1, obj_wall))//if we're not touching a wall
	{
		previousSprite = currentSprite;
		currentSprite = spr_cashMan;
		horizontalSpeed = walkSpeed;
		sprite_index = currentSprite; //sprite_index actually changes the sprite to the correct one
	}
	else
	{
		if(readyForCash == true)
		{
			//verticalSpeed = jumpSpeed;
			readyForCash = false;
		    previousSprite = currentSprite;
			image_index = 0; //image_index sets the frame of the animation
			horizontalSpeed = stopSpeed;
			currentSprite = spr_CashMan_cash;
			hitBox = instance_create_layer(x + (hitBoxOffset * sign(horizontalSpeed)), y, "CashMan", obj_CashMan_hitBox)
		    sprite_index = currentSprite; 
		}
		else
		{
			if(horizontalSpeed == 0) && (currentSprite != spr_CashMan_cash)
			{
				previousSprite = currentSprite;
				currentSprite = spr_cashMan;
				horizontalSpeed = walkSpeed;
				sprite_index = currentSprite; 
			}
			else if (currentSprite != spr_CashMan_cash)
			{
				previousSprite = currentSprite;
				currentSprite = spr_CashMan_walk;
				horizontalSpeed = horizontalSpeed;
				sprite_index = currentSprite; 
			}
		}
	}
	if(horizontalSpeed != 0) image_xscale = sign(horizontalSpeed); //flip the sprite based on the horizontal speed
}
else 
{
	if(!scoreAdded)
	{
		//scoreAdded = true;
		//with(obj_player) dicksCut += 1;
	}
	sprite_index = spr_cashMan_die;
}