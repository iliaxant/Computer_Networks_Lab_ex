//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package inet.examples.lab_dup_2024;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.eigrp.EigrpRouter;
import inet.node.ethernet.EthernetHost;
import inet.node.inet.StandardHost;
import inet.node.inet.Router;
import ned.DatarateChannel;

network Lab545
{
    @display("bgb=524,364");
    submodules:
        Router1: Router {
            @display("p=234,178");
        }
        Router2: Router {
            @display("p=339,178");
        }
        Sender1: StandardHost {
            @display("p=144,115");
        }
        Sender2: StandardHost {
            @display("p=144,273");
        }
        Sender3: StandardHost {
            @display("p=339,85");
        }
        Receiver1: StandardHost {
            @display("p=443,226");
        }
        Receiver2: StandardHost {
            @display("p=443,143");
        }
        Receiver3: StandardHost {
            @display("p=339,282");
        }
        configurator: Ipv4NetworkConfigurator {
            parameters:
                @display("p=47,178;is=s");
        }
    connections:
        // X=5 Y=4 Z=5
        Sender1.pppg++ <--> {  delay = 20ms; datarate = 5Mbps; } <--> Router1.pppg++;
        Sender2.pppg++ <--> {  delay = 20ms; datarate = 6Mbps; } <--> Router1.pppg++;
        Router1.pppg++ <--> {  delay = 20ms; datarate = 2Mbps; per = 4e-2; } <--> Router2.pppg++;
        Router2.pppg++ <--> {  delay = 20ms; datarate = 60Mbps; } <--> Sender3.pppg++;
        Router2.pppg++ <--> {  delay = 20ms; datarate = 4Mbps; } <--> Receiver2.pppg++;
        Router2.pppg++ <--> {  delay = 20ms; datarate = 2Mbps; } <--> Receiver1.pppg++;
        Router2.pppg++ <--> {  delay = 20ms; datarate = 6Mbps; } <--> Receiver3.pppg++;
}
