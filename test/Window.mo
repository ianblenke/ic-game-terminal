import Result "mo:base/Result";
import Array "mo:base/Array";
import I "mo:base/Iter";
import Debug "mo:base/Debug";
import P "mo:base/Prelude";
import Render "mo:redraw/Render";

actor {

  type KeyInfo = {
    key : Text;
    alt : Bool;
    ctrl : Bool;
    meta: Bool;
    shift: Bool
  };

  flexible var windowDim : Render.Dim = {
    width = 100;
    height = 100;
  };

  func render() : Render.Result {
    #ok(
      #draw(
        #rect({pos={
                 x=windowDim.width / 4;
                 y=windowDim.height / 4
               };
               dim={
                 width=windowDim.width / 2;
                 height=windowDim.height / 2;
               }},
              #open((windowDim.width % 255, 200, windowDim.height % 255), 1)
        )
      )
    )
  };

  public func windowSizeChange(wdim:Render.Dim) : async Render.Result {
    Debug.print "windowSizeChange";
    Debug.print (debug_show wdim);
    windowDim := wdim;
    render()
  };

  public func updateKeyDown( keys : [KeyInfo] ) : async Render.Result {
    Debug.print "updateKeyDown";
    Debug.print (debug_show keys);
    render()
  };

  public query func queryKeyDown( keys : [KeyInfo] ) : async Render.Result {
    Debug.print "queryKeyDown";
    Debug.print (debug_show keys);
    render()
  };

}
