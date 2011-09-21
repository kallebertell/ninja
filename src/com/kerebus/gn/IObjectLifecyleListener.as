package com.kerebus.gn
{
	import com.kerebus.gn.object.BaseObject;
	
	public interface IObjectLifecyleListener
	{
		function objectAdded(object : BaseObject) : void;
		function objectRemoved(object : BaseObject) : void;	
	}
}