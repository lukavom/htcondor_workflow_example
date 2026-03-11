#include <iostream>
#include <fstream>
#include <string>

int main() {
    std::string filename = "output.txt";
    std::ofstream outFile(filename);
    
    if (outFile.is_open()) {
        outFile << "Hello, World!" << std::endl;
        outFile << "This is a simple C++ program that writes to a file." << std::endl;
        outFile.close();
        
        std::cout << "Successfully wrote text to " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << " for writing." << std::endl;
        return 1;
    }
    
    return 0;
}
