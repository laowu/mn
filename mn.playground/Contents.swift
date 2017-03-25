//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let totalNum = 10
let consumeNum = 4

//消费节点 序号
var consumeNode = [Int]()
consumeNode.append(4)
consumeNode.append(2)
consumeNode.append(1)

//带宽需求数组
var require = [5,7,4]



//路径距离矩阵
var matrix = [[Int]]()
for i in 0..<5{
    matrix.append([])
    for j in 0..<5{
        matrix[i].append(11111)
    }
    matrix[i][i] = 0
}

//带宽上限矩阵
var limit = [[Int]]()
for i in 0..<5{
    limit.append([])
    for j in 0..<5{
        limit[i].append(0)
    
    }

}




//记录
var path = [[Int]]()
for i in 0..<5{
    path.append([])
    for j in 0..<5{
        path[i].append(j)
        
    }
    
}
path

//for j in 0..<5{
//    matrix[j][j] = 0
//}

func Input(matrix: inout [[Int]], m: Int, n: Int, len: Int)
{
    
    matrix[m][n] = len
    matrix[n][m] = len
}

Input(matrix: &matrix, m: 3, n: 4, len: 6)
Input(matrix: &matrix, m: 2, n: 4, len: 8)
Input(matrix: &matrix, m: 2, n: 3, len: 2)
Input(matrix: &matrix, m: 1, n: 3, len: 1)
Input(matrix: &matrix, m: 1, n: 4, len: 9)
Input(matrix: &matrix, m: 1, n: 2, len: 5)
Input(matrix: &matrix, m: 0, n: 4, len: 12)
Input(matrix: &matrix, m: 0, n: 3, len: 4)
Input(matrix: &matrix, m: 0, n: 1, len: 2)
for k in 0..<5{
    for i in 0..<5{
        for j in 0..<5{
            if (matrix[i][j] > matrix[i][k] + matrix[k][j]){
                matrix[i][j] = matrix[i][k] + matrix[k][j]
                path[i][j] = path[i][k]
            }

        }
    }
}


func pathPrint(from: Int, to: Int)
{
    var c = from
    print("from \(from) to \(to)")
    print("start: \(from)")
    while(c != to)
    {
        print("next:\(path[c][to])")
        c = path[c][to]
    }

}



var totalCost = [Int](arrayLiteral: 0,0,0,0,0)
var mimCost = 1000
var nodeIndex = 0
for i in 0..<5{

    for j in 0..<consumeNode.count{

        totalCost[i] = totalCost[i] + matrix[i][consumeNode[j]]

    }

    if (totalCost[i] < mimCost)
    {
        mimCost = totalCost[i]
        nodeIndex = i
    }

}
print(mimCost)
print(nodeIndex)



pathPrint(from: 0, to: 4)




//需求 消费总带宽

//约束 线路带宽



