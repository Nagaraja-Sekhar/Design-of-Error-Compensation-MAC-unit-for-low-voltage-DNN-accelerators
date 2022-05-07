import numpy,random

def quant(x, alpha, beta):
    N=8
    x_clamp = min(max(x, alpha), beta)
    #print(x_clamp)
    S = (beta - alpha)/(2**N-1)
    #print(S)
    Z = round(beta/S) - 2**(N-1)
    #print(Z)
    quant_x = round(x_clamp/S) + Z
    return quant_x

def coe_weight_activation(filename, file_data):
    with open(filename,'w') as f:
        f.write(";Binary equivalent of weight and activation\n")
        f.write("memory_initialization_radix=2;\n")
        f.write("memory_initialization_vector=\n")
        for i in range(len(file_data)-1):
            f.write(file_data[i]+",\n")
        f.write(file_data[len(file_data)-1]+";")


def actual_float_for_mac(filename, file_data):
    with open(filename, 'w') as f:
        f.write("# actual float values for weight and activation\n");
        for i in range(len(file_data)):
            f.write(str(file_data[i])+"\n")


def int_to_bin(num_int):
    # negative numbers changed to 2's complement format
    if num_int < 0:
        num_int = num_int + 2**8
    num = '{0:08b}'.format(num_int)
    return num 

if __name__ == "__main__":
    numpy.random.seed(0)
    N=4   # for group 4 mac
    file_data = numpy.array(100*(2*numpy.random.rand(2*N)-1))
    alpha = -100
    beta = 100

    file_data_int=[]
    print(file_data)

    for i in range(0,len(file_data)-1,2):
        weight_1 = quant(file_data[i], alpha, beta)
        print(weight_1)
        weight = int_to_bin(weight_1)
        print(weight)
        activation_1 = quant(file_data[i+1], alpha, beta)
        print(activation_1)
        activation = int_to_bin(activation_1)
        print(activation)
        print(weight+activation)
        file_data_int.append(weight+activation)

    coe_weight_activation("weight_activation.coe",file_data_int)
    actual_float_for_mac("float_weight_activation.txt",file_data)





