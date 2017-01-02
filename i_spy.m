function [r,c] = i_spy ( object_im, big_im, x )

Ro = size(object_im, 1); 
Co = size(object_im, 2); 

Rb = size(big_im, 1); 
Cb = size(big_im, 2); 

o_im = int16(object_im);
b_im = int16(big_im);

o_tl = (o_im(1 , 1)); %object image top left pixel value
o_tr = (o_im(1 , Co)); %object image top right pixel value
o_bl = (o_im(Ro , 1)); %object image bottom left pixel value
o_br = (o_im(Ro , Co)); %object image bottom right pixel value

for r = 1 : Rb - (Ro-1)
   Lia = find(ismember(x.sortedImgPixel(r , 1:end - (Co-1)) , o_tl));%end - (Co-1)
   %c = 1;
   if(~isempty(Lia))
       n = length(Lia);
       for k = 1 : n
           c = x.originalPixelIndex(r , Lia(k));
           if(o_tr == big_im(r , c + (Co-1))  && ...
              o_bl ==  big_im(r +(Ro-1) , c )  && ...
              o_br == big_im(r +(Ro-1) , c + (Co-1)))% short ciruiting and
              diff_val = b_im(r:r+(Ro-1), c:c+(Co-1), : ) - o_im; 
              if ( sum ( abs ( diff_val(:)) ) == 0 )
                    %imshow(big_im);
                    %coords = [r(1) , c(1) , r(1) + (Ro - 1) , c(1) + (Co-1)];
                    %rectangle('Position' , coords );
               return;
              end;
           end;
       end;
   end;
end;
