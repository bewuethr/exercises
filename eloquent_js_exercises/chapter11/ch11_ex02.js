function Promise_all(promises) {
    return new Promise((resolve, reject) => {
        let ctr = promises.length;
        let resArray = [];
        if (ctr === 0) resolve(resArray);
        for (let idx = 0; idx < promises.length; ++idx) {
            promises[idx].then(result => {
                resArray[idx] = result;
                --ctr;
                if (ctr === 0) resolve(resArray);
            }, reject);
        }
    });
}
