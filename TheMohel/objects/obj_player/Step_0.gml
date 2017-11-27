//Get player movement
key_left = keyboard_check(ord("A")); //will be 1 if pressed 0 if not.
key_right = keyboard_check(ord("D"));// will be 1 if pressed 0 if not.
key_jump = keyboard_check_pressed(ord("W"));

//calculate movement
var move = key_right - key_left; //will return either 1 or -1 if one key pressed, and 0 if neither or both
horizontalSpeed = move * moveSpeed; //because of move, we'll either get a negative or positive and move
verticalSpeed = verticalSpeed + grv; //in GM, the higher the number, the lower you are.
if(place_meeting(x, y + 1, obj_wall)) && (key_jump)//if we're on the floor and we're clicking the jump keep
{
	verticalSpeed = jumpSpeed;
}
else if(playerHit) verticalSpeed = jumpSpeed;


//horizontal collision
if(place_meeting(x + horizontalSpeed, y, obj_wall)) //place_meeting checks if there WILL be a collision
{
	while(!place_meeting(x + sign(horizontalSpeed), y, obj_wall)) //sign returns 1 or -1 depending on whether the variable we pass is positive or negative
	{
		x = x + sign(horizontalSpeed); //make it so we can actually hit the wall
	}
	horizontalSpeed = 0;
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

if(currentSprite != spr_player_melee) && (instance_exists(obj_player_hitBox))
{
	with(obj_player_hitBox) instance_destroy();
}

if(!place_meeting(x, y + 1, obj_wall))//if we're not touching a wall
{
	previousSprite = currentSprite;
	currentSprite = spr_player_jump;
	moveSpeed = walkSpeed;
	sprite_index = currentSprite; //sprite_index actually changes the sprite to the correct one
}
else
{
	if(currentSprite != spr_player_melee) && (mouse_check_button_pressed(mb_left)) //(mouse_check_button_pressed(mb_left))
	{
	    previousSprite = currentSprite;
		image_index = 0; //image_index sets the frame of the animation
		moveSpeed = stopSpeed;
		currentSprite = spr_player_melee;
		instance_create_layer(x + (hitBoxOffset * image_xscale), y, "Player", obj_player_hitBox);
	    sprite_index = currentSprite; 
	}
	else
	{
		if(horizontalSpeed == 0) && (currentSprite != spr_player_melee)
		{
			previousSprite = currentSprite;
			currentSprite = spr_player;
			moveSpeed = walkSpeed;
			sprite_index = currentSprite; 
		}
		else if (currentSprite != spr_player_melee)
		{
			previousSprite = currentSprite;
			currentSprite = spr_player_run;
			moveSpeed = walkSpeed;
			sprite_index = currentSprite; 
		}
	}
}
if(horizontalSpeed != 0) image_xscale = sign(horizontalSpeed); //flip the sprite based on the horizontal speed
