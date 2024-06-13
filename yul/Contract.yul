// @title Contract
object "Contract" {
    code {
        // Remove if not needed, owner by default is stored on 0 slot
        sstore(returndatasize(), origin())

        datacopy(returndatasize(), dataoffset("runtime"), datasize("runtime"))

        return(returndatasize(), datasize("runtime"))
    }
    object "runtime" {
        code {
            // Runtime code here
        }
    }
}
