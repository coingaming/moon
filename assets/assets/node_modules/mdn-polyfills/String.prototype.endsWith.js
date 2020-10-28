String.prototype.endsWith||(String.prototype.endsWith=function(t,n){return n<this.length?n|=0:n=this.length,this.substr(n-t.length,t.length)===t});
