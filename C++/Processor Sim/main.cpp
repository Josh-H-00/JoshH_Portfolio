#include "process.h"

#include <chrono> // for sleep
#include <thread> // for sleep

#include <algorithm>

int main(int argc, char* argv[])
{
    // single thread processor
    // it's either processing something or it's not
    bool processorAvailable = true;
    // vector of processes, fill by reading from a file
    vector<Process> processList;

    long time = 1;
    long sleepDuration = 50;
    string file;
    stringstream ss;

    switch(argc)
    {
        case 1:
            file = "procList.txt";  // default input file
            break;
        case 2:
            file = argv[1];         // file given from command line
            break;
        case 3:
            file = argv[1];         // file given
            ss.str(argv[2]);        // sleep duration given
            ss >> sleepDuration;
            break;
        default:
            cerr << "incorrect number of command line arguments" << endl;
            cout << "usage: " << argv[0] << " [file] [sleepDuration]" << endl;
            return 1;
            break;
    }
    
    ifstream f = ifstream( file );
    
    while( getline( f, file ) )
    {
      // Create new process for each line
      Process p = Process();
      
      string d = " ";
      p.arrivalTime = stoi( file.substr( 0, file.find( d ) ) );
      file.erase( 0, 1 + file.find( d ) );
      p.reqProcessorTime = stoi( file.substr( 0, file.find( d ) ) );
      file.erase( 0, file.find( d ) );
      
      while ( file.length() >= 1 )
      {
        // Create new IO Event for each pair of numbers after the first
        IOEvent e = IOEvent();
        
        file.erase( 0, 1 + file.find( d ) );
        e.time = stoi( file.substr( 0, file.find( d ) ) );
        file.erase( 0, 1 + file.find( d ) );
        e.duration = stoi( file.substr( 0, file.find( d ) ) );
        file.erase( 0, file.find( d ) );
        
        p.ioEvents.push_back(e);
      }
      
      processList.push_back(p);
    }
    
    f.close();
    unsigned int numDone = 0;
    
    while( processList.size() != numDone )
    {
      for (Process& p : processList)
        if ( ( p.state == blocked && p.currentEvent.duration-- <= 1) ||
        ( p.state == notArrived && p.arrivalTime == time ) )
          p.state = ready;
          
      if ( processorAvailable )
        for ( Process& p : processList )
          if ( p.state == ready )
          {
            processorAvailable = 0;
            p.state = processing;
            
            break;
          }
          
      for (Process& p : processList)
        if (p.state == processing)
        {
          p.processorTime ++;
          
          for (IOEvent& e : p.ioEvents)
          {
            
           if (e.time-- == 0)
            {
              processorAvailable = 1;
              p.state = blocked;
              p.currentEvent = e;
            }
          }
          
          if ( p.processorTime >= p.reqProcessorTime && p.state != blocked )
          {
            p.state = done;
            processorAvailable = 1;
            
            numDone ++;
          }
        }

      cout << time++ << '\t';
      printProcessStates(processList); // change processList to another vector of processes if desired
      this_thread::sleep_for(chrono::milliseconds(sleepDuration));
    }

    return 0;
}
