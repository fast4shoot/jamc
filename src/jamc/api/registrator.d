/* Assignment ID of block to name of block
 * (name is for example: buildcraft.filler)
 * and ID of item to name of item
 */

module jamc.api.registrator;

class Registrator {
    
    private uint[string] assignment;
    private uint lastId = 0;
    private uint maximumId = 255;
    
    public bool existName(string name){
        return (name.get(name,-1)!=-1);
    }
    
    public uint getIdOfName(string name){
        return assignment[name];
    }
    
    public uint generateIdOfName(string name){
        if(existName(name)){
            return assignment[name];
        }else{
            lastId++;
            if(lastId > maximumId){
                throw new RegistratorException("Registrator exception! Too much block/item types!");
            }
            assignment[name] = lastId;
            return lastId;
        }
    }
    
}

class RegistratorException : Exception {
    this(string msg){
        super(msg);
    }
}

