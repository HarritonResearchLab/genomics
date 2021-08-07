def sokolovskyNu(x,xerr):
    # Import(s)
    import numpy as np
    
    # Action
    # Equation: [ (m-e)max - (m+e)min ] / [ (m-e)max + (m+e)min ]

    x = np.array(x)
    xerr = np.array(xerr)
    
    x_minus_xerr = x-xerr
    x_plus_xerr = x+xerr
    
    min_val = np.amin(x_plus_xerr)
    max_val = np.amax(x_minus_xerr)
    
    nu = (max_val-min_val)/(max_val+min_val)
    return nu
