function   net=apply_ga(net,Opt,O)

input_weights=net.IW;
new_weights=input_weights{1,1};
new_weight(1:13,1:13)=rand;
input_weights=new_weight;

net.IW{1,1}=input_weights;

handle = @(x) mse_test(Opt,O);
ga_opts = gaoptimset('TolFun', 1e-6,'display','iter','PopulationSize',20,'EliteCount',2,'CrossoverFraction',0.8000,...
                     'MigrationInterval',20,'MigrationFraction',0.2000,'Generations',100);
                 
no_of_weights=169;                 
[x_ga_opt, err_ga] = ga(handle, no_of_weights, ga_opts);
ii=1;
kk=1;
for jj=1:13:length(x_ga_opt)

    weights(kk,1:13)=x_ga_opt(1,jj:jj+12);
    kk=kk+1;
end
net.IW{1,1}=weights;
