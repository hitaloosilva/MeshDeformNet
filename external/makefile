nvcc = /usr/local/cuda-12.1/bin/nvcc
cudalib =/usr/local/cuda-12.1/lib64
tensorflow = /media/hitalo/files/Doutorado/env/lib/python3.10/site-packages/tensorflow/include
TF_LIB= /media/hitalo/files/Doutorado/env/lib/python3.10/site-packages/tensorflow
all: tf_nndistance_so.so tf_nndistance_g.cu.o 

tf_nndistance_so.so: tf_nndistance_g.cu.o tf_nndistance.cpp
	g++ -std=c++17 tf_nndistance.cpp tf_nndistance_g.cu.o -o tf_nndistance_so.so -shared -fPIC -I $(tensorflow) -lcudart -L $(cudalib) -O2 -L "$(TF_LIB)" -ltensorflow_framework -D_GLIBCXX_USE_CXX17_ABI=0

tf_nndistance_g.cu.o: tf_nndistance_g.cu
	$(nvcc) -std=c++17 -c -o tf_nndistance_g.cu.o tf_nndistance_g.cu -I $(tensorflow) -D GOOGLE_CUDA=1 -x cu -Xcompiler -fPIC -O2  --expt-relaxed-constexpr

clean:
	rm tf_nndistance_so.so
	rm  *.cu.o 
