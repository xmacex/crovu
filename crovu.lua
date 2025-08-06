---crovu. VU for crow
-- → 1 input
--   1 rms ≥ 1V →
--   2 rms ≥ 2V →
--   3 rms ≥ 3V →
--   4 rms ≥ 4V →

MINV  = -5
MAXV  = 10
TRUEV = 5
FALSEV = 0

public{freq   = 1/666}:range(1, 1/666)
public{falsev = 0}:range(MINV, MAXV)
public{truev  = 5}:range{MINV, MAXV}
public{rms    = 0}:type('@')

function init()
   input[1].mode("volume", public.freq)
   input[1].volume = vu
end

function vu(rms)
   for i=1,4 do
      public.rms = rms
      if rms >= i then
	 output[i].volts = public.truev
      else
	 output[i].volts = public.falsev
      end
   end
end
