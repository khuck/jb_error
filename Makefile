CXXFLAGS=$(shell pkg-config --cflags hpx_application_debug) -g
LDFLAGS=$(shell pkg-config --libs hpx_application_debug) -g

all: error error_pre error_post error_async error_pre_async error_post_async

default: all

#-------------------------------------------
# Synchronous "then" task
error: error.o
	g++ -o error error.o $(LDFLAGS)

error.o : error.cpp Makefile
	g++ -c error.cpp $(CXXFLAGS)
#-------------------------------------------

#-------------------------------------------
# Synchronous "then" task with annotated_function
error_pre: error_pre.o
	g++ -o error_pre error_pre.o $(LDFLAGS)

error_pre.o : error.cpp Makefile
	g++ -c error.cpp $(CXXFLAGS) -DANNOTATE_PRE -o error_pre.o
#-------------------------------------------

#-------------------------------------------
# Synchronous "then" task with annotate_function
error_post: error_post.o
	g++ -o error_post error_post.o $(LDFLAGS)

error_post.o : error.cpp Makefile
	g++ -c error.cpp $(CXXFLAGS) -DANNOTATE_POST -o error_post.o
#-------------------------------------------

#-------------------------------------------
# Asynchronous "then" task
error_async: error_async.o
	g++ -o error_async error_async.o $(LDFLAGS)

error_async.o : error.cpp Makefile
	g++ -c error.cpp $(CXXFLAGS) -DASYNC -o error_async.o
#-------------------------------------------

#-------------------------------------------
# Asynchronous "then" task with annotated_function
error_pre_async: error_pre_async.o
	g++ -o error_pre_async error_pre_async.o $(LDFLAGS)

error_pre_async.o : error.cpp Makefile
	g++ -c error.cpp $(CXXFLAGS) -DASYNC -DANNOTATE_PRE -o error_pre_async.o

#-------------------------------------------
# Asynchronous "then" task with annotate_function
error_post_async: error_post_async.o
	g++ -o error_post_async error_post_async.o $(LDFLAGS)

error_post_async.o : error.cpp Makefile
	g++ -c error.cpp $(CXXFLAGS) -DASYNC -DANNOTATE_POST -o error_post_async.o
#-------------------------------------------

clean:
	rm -f error error_pre error_post error_async error_pre_async error_post_async *.o

