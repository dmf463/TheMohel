///@desc SlideTransition(mode, targetRoom)
///@arg Mode sets transition mode between next, restart, goto.
///@arg TargetRoom sets target room when using goto mode.

with(obj_transition)
{
	mode = argument[0];
	if(argument_count > 1) target = argument[1];
}