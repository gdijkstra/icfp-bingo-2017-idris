module Effect.Random.Shuffle

import Effects
import Effect.Random
import Data.Vect

%default total

export shuffle : Vect n a -> Eff (Vect n a) [RND]
shuffle [] = pure []
shuffle {n = S n} xs@(x :: xs') = do
    k <- rndFin n
    let x' = index k xs
    let (_ :: xs') = replaceAt k x xs
    (x' ::) <$> shuffle xs'

-- Local Variables:
-- idris-load-packages: ("contrib" "effects")
-- End:
