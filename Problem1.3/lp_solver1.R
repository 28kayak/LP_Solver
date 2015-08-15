library(lpSolveAPI) 
lps.model <- make.lp(0,2)
#make.lp(a,b) where a = number of constraints(cannot be negative)
# and b = number of dicisiton varibales
set.objfn(lps.model, c(120,80))
#constraint for availability of wood
add.constraint(lps.model, c(2,1), "<=",6)
#constraint for availability of time
add.constraint(lps.model, c(7,8), "<=",28)
#constrains for non-negativity
#add.constrain(lps.model,c(1,0), ">=" 0)
lp.control(lps.model,sense='max')
#Now Solve
#see if there is solution
write.lp(lps.model,'model.lp',type='lp')
solve(lps.model)
#solve(model_name) will return status value:
#0:  "optimal solution found"                                                         
#1:  "the model is sub-optimal"                                                       
#2:  "the model is infeasible"                                                        
#3:  "the model is unbounded"                                                         
#4:  "the model is degenerate"                                                        
#5:  "numerical failure encountered"                                                  
#6:  "process aborted"                                                                
#7:  "timeout"                                                                        
#9:  "the model was solved by presolve"                                               
#10:  "the branch and bound routine failed"                                            
#11:  "the branch and bound was stopped because of a break-at-first or break-at-value" 
#12:  "a feasible branch and bound solution was found"                                 
#13:  "no feasible branch and bound solution was found"    

#in this case, return 0, which means "optimal solution found"
get.objective(lps.model)
get.variables(lps.model)