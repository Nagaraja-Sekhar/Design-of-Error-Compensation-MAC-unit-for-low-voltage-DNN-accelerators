def read_weight_activation(filename):
    with open(filename, 'r') as f:
        file_data = f.readlines()
        return file_data


if __name__ == "__main__":
    weight_activation = read_weight_activation("float_weight_activation.txt")
    # print(weight_activation)
    #print(weight_activation[1],type(weight_activation[1]))
    #t=float(weight_activation[1])
    #print(t,type(t))
    
    partial_sum_out = 0
    for i in range(1,len(weight_activation),2):
        weight = float(weight_activation[i])
        activation = float(weight_activation[i+1])
        partial_sum_out = partial_sum_out + weight*activation
    print(partial_sum_out)
    