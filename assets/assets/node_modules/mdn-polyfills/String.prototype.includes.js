String.prototype.includes||(String.prototype.includes=function(t,n){return"number"!=typeof n&&(n=0),!(n+t.length>this.length)&&-1!==this.indexOf(t,n)});
