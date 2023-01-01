[ ! -d out/target/product/pocket3/vendor/firmware ] && mkdir -p out/target/product/pocket3/vendor/firmware
[ ! -d out/target/product/pocket3/vendor/lib/npidevice ] && mkdir -p out/target/product/pocket3/vendor/lib/npidevice
[ ! -d out/target/product/pocket3/vendor/productinfo ] && mkdir -p out/target/product/pocket3/vendor/productinfo
[ ! -L out/target/product/pocket3/vendor/firmware/audio_structure ] && ln -s /data/vendor/local/media/audio_params/audio_structure out/target/product/pocket3/vendor/firmware/audio_structure
[ ! -L out/target/product/pocket3/vendor/firmware/cvs ] && ln -s /data/vendor/local/media/audio_params/cvs out/target/product/pocket3/vendor/firmware/cvs
[ ! -L out/target/product/pocket3/vendor/firmware/dsp_smartamp ] && ln -s /data/vendor/local/media/audio_params/dsp_smartamp out/target/product/pocket3/vendor/firmware/dsp_smartamp
[ ! -L out/target/product/pocket3/vendor/firmware/dsp_vbc ] && ln -s /data/vendor/local/media/audio_params/dsp_vbc out/target/product/pocket3/vendor/firmware/dsp_vbc

[ ! -d out/target/product/pocket3/vendor/lib/npidevice ] && mkdir -p out/target/product/pocket3/vendor/lib/npidevice
[ ! -L out/target/product/pocket3/vendor/lib/npidevice/libaudionpi.so ] && ln -s /vendor/lib/libaudionpi.so out/target/product/pocket3/vendor/lib/npidevice/libaudionpi.so
[ ! -L out/target/product/pocket3/vendor/lib/npidevice/libcamcalitest.so ] && ln -s /vendor/lib/libcamcalitest.so out/target/product/pocket3/vendor/lib/npidevice/libcamcalitest.so
[ ! -L out/target/product/pocket3/vendor/lib/npidevice/libnpi_rtc.so ] && ln -s /vendor/lib/libnpi_rtc.so out/target/product/pocket3/vendor/lib/npidevice/libnpi_rtc.so
[ ! -L out/target/product/pocket3/vendor/lib/npidevice/libsensornpi.so ] && ln -s /vendor/lib/libsensornpi.so out/target/product/pocket3/vendor/lib/npidevice/libsensornpi.so
cp device/retroid/pocket3/prebuilt/dtb out/target/product/pocket3/dtb.img
