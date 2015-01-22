Rem
Rem $Header: pm_p_ord.sql 10-jan-2005.11:15:05 cbauwens Exp $
Rem
Rem pm_p_ord.sql
Rem
Rem Copyright (c) 2001, 2015, Oracle. All rights reserved.  
Rem 
Rem Permission is hereby granted, free of charge, to any person obtaining
Rem a copy of this software and associated documentation files (the
Rem "Software"), to deal in the Software without restriction, including
Rem without limitation the rights to use, copy, modify, merge, publish,
Rem distribute, sublicense, and/or sell copies of the Software, and to
Rem permit persons to whom the Software is furnished to do so, subject to
Rem the following conditions:
Rem 
Rem The above copyright notice and this permission notice shall be
Rem included in all copies or substantial portions of the Software.
Rem 
Rem THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
Rem EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
Rem MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
Rem NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
Rem LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
Rem OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
Rem WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Rem
Rem    NAME
Rem      pm_p_ord.sql - Populate script 2/3: Online_Media table
Rem
Rem    DESCRIPTION
Rem      PM is the Product Media schema of the Oracle 9i Sample
Rem        Schemas
Rem
Rem    NOTES
Rem
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    cbauwens    01/10/05 - lrg 1743854
Rem    cbauwens    11/05/03 - bug3236343 
Rem    hyeh        08/29/02 - hyeh_mv_comschema_to_rdbms
Rem    ahunold     02/14/02 - bug 1947899
Rem    ahunold     09/04/01 - RM files
Rem    ahunold     02/09/01 - Merged ahunold_pm_load
Rem    ahunold     02/05/01 - Created
Rem


INSERT INTO online_media VALUES (2400, 
        ORDSYS.ORDImage.init('FILE','MEDIA_DIR','dimm1.jpg'),
        ORDSYS.ORDImageSignature.init(),
        ORDSYS.ORDImage.init(),
        ORDSYS.ORDVideo.init('FILE', 'MEDIA_DIR', 'dimm1.rm'),
        ORDSYS.ORDAudio.init('FILE', 'MEDIA_DIR', 'dimm1.mpa'),
        EMPTY_CLOB(),
        ORDSYS.ORDDoc.init());
INSERT INTO online_media VALUES (1743, 
        ORDSYS.ORDImage.init('FILE','MEDIA_DIR','harddrive.jpg'),
        ORDSYS.ORDImageSignature.init(),
        ORDSYS.ORDImage.init(),
        ORDSYS.ORDVideo.init('FILE', 'MEDIA_DIR', 'harddrive.rm'),
        ORDSYS.ORDAudio.init('FILE', 'MEDIA_DIR', 'harddrive.mpa'),
        EMPTY_CLOB(),
        ORDSYS.ORDDoc.init());
INSERT INTO online_media VALUES (3106, 
        ORDSYS.ORDImage.init('FILE','MEDIA_DIR','keyboard.jpg'),
        ORDSYS.ORDImageSignature.init(),
        ORDSYS.ORDImage.init(),
        ORDSYS.ORDVideo.init('FILE', 'MEDIA_DIR', 'keyboard.rm'),
        ORDSYS.ORDAudio.init('FILE', 'MEDIA_DIR', 'keyboard.mpa'),
        EMPTY_CLOB(),
        ORDSYS.ORDDoc.init());
INSERT INTO online_media VALUES (3003, 
        ORDSYS.ORDImage.init('FILE','MEDIA_DIR','laptop.jpg'),
        ORDSYS.ORDImageSignature.init(),
        ORDSYS.ORDImage.init(),
        ORDSYS.ORDVideo.init('FILE', 'MEDIA_DIR', 'laptop.rm'),
        ORDSYS.ORDAudio.init('FILE', 'MEDIA_DIR', 'laptop.mpa'),
        EMPTY_CLOB(),
        ORDSYS.ORDDoc.init());
INSERT INTO online_media VALUES (2268, 
        ORDSYS.ORDImage.init('FILE','MEDIA_DIR','modem.jpg'),
        ORDSYS.ORDImageSignature.init(),
        ORDSYS.ORDImage.init(),
        ORDSYS.ORDVideo.init('FILE', 'MEDIA_DIR', 'modem.rm'),
        ORDSYS.ORDAudio.init('FILE', 'MEDIA_DIR', 'modem.mpa'),
        EMPTY_CLOB(),
        ORDSYS.ORDDoc.init());
INSERT INTO online_media VALUES (3060, 
        ORDSYS.ORDImage.init('FILE','MEDIA_DIR','monitor.jpg'),
        ORDSYS.ORDImageSignature.init(),
        ORDSYS.ORDImage.init(),
        ORDSYS.ORDVideo.init('FILE', 'MEDIA_DIR', 'monitor.rm'),
        ORDSYS.ORDAudio.init('FILE', 'MEDIA_DIR', 'monitor.mpa'),
        EMPTY_CLOB(),
        ORDSYS.ORDDoc.init());
INSERT INTO online_media VALUES (3117, 
        ORDSYS.ORDImage.init('FILE','MEDIA_DIR','mouse.jpg'),
        ORDSYS.ORDImageSignature.init(),
        ORDSYS.ORDImage.init(),
        ORDSYS.ORDVideo.init('FILE', 'MEDIA_DIR', 'mouse.rm'),
        ORDSYS.ORDAudio.init('FILE', 'MEDIA_DIR', 'mouse.mpa'),
        EMPTY_CLOB(),
        ORDSYS.ORDDoc.init());
INSERT INTO online_media VALUES (2056, 
        ORDSYS.ORDImage.init('FILE','MEDIA_DIR','mousepad.jpg'),
        ORDSYS.ORDImageSignature.init(),
        ORDSYS.ORDImage.init(),
        ORDSYS.ORDVideo.init('FILE', 'MEDIA_DIR', 'mousepad.rm'),
        ORDSYS.ORDAudio.init(),
        EMPTY_CLOB(),
        ORDSYS.ORDDoc.init());
INSERT INTO online_media VALUES (2453, 
        ORDSYS.ORDImage.init('FILE','MEDIA_DIR','printer.jpg'),
        ORDSYS.ORDImageSignature.init(),
        ORDSYS.ORDImage.init(),
        ORDSYS.ORDVideo.init('FILE', 'MEDIA_DIR', 'printer.rm'),
        ORDSYS.ORDAudio.init('FILE', 'MEDIA_DIR', 'printer.mpa'),
        EMPTY_CLOB(),
        ORDSYS.ORDDoc.init());
COMMIT;

DECLARE
    id NUMBER;
    image ORDSYS.ORDImage;
    thumb ORDSYS.ORDImage;
    audio ORDSYS.ORDAudio;
    video ORDSYS.ORDVIdeo;
    ctx RAW(4000) := NULL;

    CURSOR getphotos IS
        SELECT M.product_id, M.product_photo, M.product_thumbnail,
               M.product_audio, M.product_video
        FROM online_media M
        FOR UPDATE;
BEGIN
    FOR product IN getphotos LOOP

      BEGIN

--     
--      Import images, audios and videos 
--
        product.product_audio.import(ctx);
        product.product_video.import(ctx);
        product.product_photo.import(ctx);

--
--      Extract properties and generate thumbnails
-- 
        product.product_audio.setProperties(ctx, TRUE);
        product.product_video.setProperties(ctx, TRUE);
        product.product_photo.processCopy('maxscale = 64 64', 
                product.product_thumbnail);


        EXCEPTION WHEN OTHERS THEN
          NULL;
      END;

      UPDATE online_media SET product_photo=product.product_photo, 
                                product_thumbnail=product.product_thumbnail,
                                product_video=product.product_video,
                                product_audio=product.product_audio
      WHERE product_id = product.product_id;
    END LOOP;
   COMMIT;   
END;
/
